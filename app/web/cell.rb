# frozen_string_literal: true
module Web
  class Cell
    # rendering
    def render(parent, &block)
      using_parent(parent) do
        render_partial(block)
      end
    end

    private def render_partial(block)
      binding.pry
      parent.view_renderer.render_partial(parent, partial: path_to_partial, object: self, &block)
    end

    private def path_to_partial
      name = self.class.name.underscore
      name
      # dir  = Pathname.new(File.expand_path(__dir__))
      # dir.join(name).sub_ext(".html.erb").to_s
    end

    # parent
    private def parent
      raise "No Parent" if @parent.nil?
      @parent
    end

    # transactional method for parent rendering
    private def using_parent(parent)
      @parent = parent
      output  = yield
      @parent = nil
      output
    end
  end
end
