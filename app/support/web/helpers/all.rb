module Web
  module Helpers
    module All
      include Options
      include ImageTags
      include Helpers::Game::CardsTags
    end
  end
end
