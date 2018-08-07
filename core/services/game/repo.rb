class Game
  class Repo
    def current
      Db::GameRepo.new
    end
  end
end
