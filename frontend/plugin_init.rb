Rails.application.config.after_initialize do

  ApplicationHelper.class_eval do
    alias_method :render_aspace_partial_pre_yale_repositories, :render_aspace_partial
    def render_aspace_partial(args)
      result = render_aspace_partial_pre_yale_repositories(args)

      if args[:partial] == "repositories/form_container"
        result += render_aspace_partial(:partial => 'repositories/form_ext',
                                        :locals => args[:locals])
      end

      result
    end
  end

end
