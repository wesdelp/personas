# frozen_string_literal: true

module Personas
  require 'action_view'
  # The purpose of the persona-specific file system resolver is to find view templates
  # not in persona folders. For example, if a template for home.html.erb cannot be found at
  # `app/views/admin/home.html.erb`, this resolver will remove the prefix of "admin" and
  # then try to find the template at `app/views/home.html.erb`
  class SharedPersonaFileSystemResolver < ActionView::OptimizedFileSystemResolver
    # Overrides initializer to use defaults from here: https://github.com/rails/rails/blob/ed6364f7b6579a890c5cedc3c9e5b2f8af586e9e/actionview/lib/action_view/template/resolver.rb#L320
    def initialize(path = nil)
      path ||= Rails.root.join('app', 'views')
      super(path, ':prefix/:action{.:locale,}{.:formats,}{+:variants,}{.:handlers,}')
    end

    # Overrides method to find templates and removes persona prefix. This is a
    # private method so some risk that it changes underneath us but this was weirdly recommended
    # in the source code: https://github.com/rails/rails/blob/ed6364f7b6579a890c5cedc3c9e5b2f8af586e9e/actionview/lib/action_view/template/resolver.rb#L169.
    # Original method: https://github.com/rails/rails/blob/ed6364f7b6579a890c5cedc3c9e5b2f8af586e9e/actionview/lib/action_view/template/resolver.rb#L205
    def find_templates(name, prefix, partial, details, outside_app_allowed = false)
      prefix_pieces = prefix.split('/')
      persona_prefix = prefix_pieces.first

      if RoutablePersonas.routable?(persona_prefix)
        prefix = prefix.gsub(persona_prefix, '')
        super(name, prefix, partial, details, outside_app_allowed)
      else
        super
      end
    end
  end
end
