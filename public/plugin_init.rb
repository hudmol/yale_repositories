Rails.application.config.after_initialize do

  ActionView::Renderer.class_eval do
    alias_method :render_pre_yale_repositories, :render
    def render(context, options)
      result = render_pre_yale_repositories(context, options)

      if options[:partial] == "repositories/repository"
        # display on the repo show template
        full = options.dig(:locals, :full) || false
        result += render(context, :partial => 'repositories/repository_ext',
                                  :locals => options[:locals].merge({
                                    :show_location => full,
                                    :show_map => full,
                                    :show_opening_hours => full,
                                    :show_access_information => full,
                                    :heading_tag => 'h3',
                                  }))

      elsif options[:partial] == "repositories/full_repo"
        # display in the Repository Detail accordion
        result += render(context, :partial => 'repositories/repository_ext',
                         :locals => options[:locals].merge({
                           :result => options.dig(:locals, :info, 'top') || {},
                           :show_location => true,
                           :show_map => false,
                           :show_opening_hours => true,
                           :show_access_information => true,
                           :heading_tag => 'h4',
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
        info['top']['location'] = resolved_repository['location'] || {}
        info['top']['description'] = resolved_repository['description']
      end

      info
    end
  end

end
