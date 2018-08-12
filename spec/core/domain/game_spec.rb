# frozen_string_literal: true
require 'support/rails/helper'

describe Game do
  subject do
    described_class.new
  end

  describe '#initial_state' do
    it 'produces the initial state for the configured game' do
      expect(subject.initial_state).to_not be_nil
    end
  end
end
