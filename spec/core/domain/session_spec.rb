# frozen_string_literal: true
require 'support/rails/helper'

describe Session do
  subject do
    described_class.new(game: Game.new)
  end

  describe '#start' do
    it 'sets up the session\'s initial state and starts it' do
      subject.start
      expect(subject).to be_started
      expect(subject.turns.length).to eq(1)
      expect(subject.turns.first.state).to_not be_nil
    end
  end
end
