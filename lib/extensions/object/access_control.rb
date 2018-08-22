# frozen_string_literal: true
module Extensions
  module Object
    module AccessControl
      def private_reader(*args)
        attr_reader(*args)
        private(*args)
      end
    end
  end
end

Object.extend(Extensions::Object::AccessControl)
