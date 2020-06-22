Rails.application.config.after_initialize do

  ActionView::Renderer.class_eval do
    alias_method :render_pre_yale_repositories, :render
    def render(context, options)
      result = render_pre_yale_repositories(context, options)

      if options[:partial] == "repositories/repository"
        result += render(context, :partial => 'repositories/repository_ext',
                                  :locals => options[:locals])
      end

      result
    end
  end

end
