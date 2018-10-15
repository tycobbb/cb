# frozen_string_literal: true
module Ext
  module Web
    module InMemoryMutable
      module CollectionProxy
        # Retrieves the record from the collection in-memory if the collection
        # has already beed loaded. If it its not loaded, it loads it first.
        #
        # If the record does not exist in memory, it raises `RecordNotFound`.
        #
        # @param id [Id] The id of the record to retrieve.
        def record(id)
          @association.record(id)
        end

        # Removes the record from the collection in-memory. If the collection
        # is reloaded, the changes will be lost.
        #
        # If the record does not exist in memory, it raises `RecordNotFound`.
        #
        # @param id [Id] The id of the record to remove.
        def remove_record(id)
          @association.remove_record(id)
        end
      end

      module CollectionAssociation
        def record(id)
          record = find_by_scan(id)

          if record.nil?
            scope.raise_record_not_found_exception!([id], 0, 1)
          else
            record
          end
        end

        def remove_record(id)
          record = record(id)
          return if record.new_record?

          raise_on_type_mismatch!(record)
          # nil out the foreign key
          record.assign_attributes(reflection.foreign_key => nil)
          # remove the record in-memory, pass empty existing records to avoid db
          remove_records([], [record], :delete)

          record
        end
      end
    end
  end
end

src = ActiveRecord::Associations
ext = Ext::Web::InMemoryMutable

src::CollectionProxy.include(ext::CollectionProxy)
src::CollectionAssociation.include(ext::CollectionAssociation)
