# frozen_string_literal: true
require 'support/helper'

describe Game do
  it "produces the game's initial state" do
    subject = Game.new
    _(subject.initial_state).wont_be_nil
  end
end
