Rails.application.config.after_initialize do

  ActionView::Renderer.class_eval do
    alias_method :render_pre_yale_repositories, :render
    def render(context, options)
      result = render_pre_yale_repositories(context, options)

      if options[:partial] == "repositories/repository"
        # display on the repo show template
        result += render(context, :partial => 'repositories/repository_ext',
                                  :locals => options[:locals].merge({
                                    :show_map => true,
                                    :show_opening_hours => true,
                                  }))

      elsif options[:partial] == "repositories/full_repo"
        # display in the Repository Detail accordion
        result += render(context, :partial => 'repositories/repository_ext',
                         :locals => options[:locals].merge({
                           :result => options.dig(:locals, :info, 'top') || {},
                           :show_map => false,
                           :show_opening_hours => true,
                         }))
      end

      result
    end
  end

  Record.class_eval do
    # Include the new repo fields in the parsed repository object that is
    # used about the place
    alias_method :parse_repository_info_pre_yale_repositories, :parse_repository_info
    def parse_repository_info
      info = parse_repository_info_pre_yale_repositories

      unless resolved_repository.nil?
        info['top']['libcal_id'] = resolved_repository['libcal_id']
        info['top']['latitude'] = resolved_repository['latitude']
        info['top']['longitude'] = resolved_repository['longitude']
      end

      info
    end
  end

end
