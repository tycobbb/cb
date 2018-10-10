# frozen_string_literal: true
class LoadPaths
  def initialize(root)
    @root  = root
    @paths = []
  end

  # definition
  def path(*components)
    add_paths([join(components)])
  end

  def glob(*components)
    add_paths(Dir.glob(join(components)))
  end

  # - specialization
  def lib(*components)
    path("lib", *components)
  end

  def app(*components)
    path("app", *components)
  end

  # resolution
  def take
    @paths.uniq.map(&:to_s)
  end

  def require
    take.each do |path|
      Kernel.send(:require, path)
    end
  end

  # helpers
  private def add_paths(paths)
    @paths.concat(paths)
    self
  end

  private def join(components)
    @root.join(*components)
  end
end
