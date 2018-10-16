# frozen_string_literal: true
module Web
  class Cell
    iattr :renderer, private: true

    def initialize(renderer = ::ActionController::Base.renderer)
      @renderer = renderer
    end

    # rendering
    def render(&block)
      @renderer.render(binding, file: template_path)
    end

    private def template_path
      name = self.class.name.underscore
      dir  = Pathname.new(File.expand_path(__dir__))
      dir.join(name).sub_ext(".html.erb")
    end

    # factories
    def self.render(args, **kwargs, &block)
      new(*args, **kwargs).render(&block)
    end
  end
end
