# frozen_string_literal: true
module Extensions
  module Web
    module Module
      module AccessControl
        extend ActiveSupport::Concern

        class_methods do
          def private_reader(*args)
            attr_reader(*args)
            private(*args)
          end
        end
      end
    end
  end
end

Module.include(Extensions::Web::Module::AccessControl)
