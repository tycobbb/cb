# frozen_string_literal: true
module Sessions
  class RootConnection < Web::Connection
    def connect
      puts("connected")
    end
  end
end
