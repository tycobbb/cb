# frozen_string_literal: true
module Extensions
  module Web
    module Models
      module InMemoryMutable
        module CollectionProxy
          def record(id)
            @association.record(id)
          end

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
end

src = ActiveRecord::Associations
ext = Extensions::Web::Models::InMemoryMutable

src::CollectionProxy.include(ext::CollectionProxy)
src::CollectionAssociation.include(ext::CollectionAssociation)
