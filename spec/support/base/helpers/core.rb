# frozen_string_literal: true
require 'active_support'

module Spec
  module Helpers
    module Core
      extend ActiveSupport::Concern

      def pass_all(*matchers)
        matchers.reduce(&:and)
      end
    end
  end
end

RSpec.configuration.include(Spec::Helpers::Core)
