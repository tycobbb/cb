# frozen_string_literal: true
class LoadPaths
  def path(*components)
    paths << join(components)
    self
  end

  def glob(*components)
    paths.concat(Dir.glob(join(components)))
    self
  end

  def take
    paths.uniq
  end

  # helpers
  private def paths
    @paths ||= []
  end

  private def join(components)
    Rails.application.config.root.join(*components)
  end
end
