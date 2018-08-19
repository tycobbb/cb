# frozen_string_literal: true
require 'support/helper'

describe Session do
  it 'sets up the session\'s initial state and starts it' do
    subject = Session.new(game: Game.new)
    subject.start

    _(subject).must_be(:started?)
    _(subject.turns.length).must_equal(1)
    _(subject.turns.first.state).wont_be_nil
  end
end
