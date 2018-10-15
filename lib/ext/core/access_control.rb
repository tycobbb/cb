# frozen_string_literal: true
module Ext
  module Core
    module AccessControl
      # Adds instance methods for accessing a named attribute. Always
      # generates a reader, and optionally generates an accessor.
      #
      # The scope of the methods can be limited by the `private` option. If
      # `:set` is passed, only the setter will be private.
      #
      # @param name [Symbol] The name of the attribute
      # @param setter [Boolean] (false) If a setter should be added
      # @param private [Boolean,:set] (false) If methods should be private
      def iattr(name, setter: false, private: false)
        iattr_getter(name, private == true)
        iattr_setter(name, private != false) if setter
      end

      private def iattr_getter(name, is_private)
        attr_reader(name)
        private(name) if is_private
      end

      private def iattr_setter(name, is_private)
        attr_writer(name)
        private("#{name}=") if is_private
      end
    end
  end
end

Module.include(Ext::Core::AccessControl)
