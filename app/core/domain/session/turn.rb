# frozen_string_literal: true
class Session
  class Turn < Entity
    # parents
    belongs_to :session
  end
end
