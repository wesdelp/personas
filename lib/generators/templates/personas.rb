require 'warden/manager'

Rails.application.config.middleware.insert_after Warden::Manager, Personas::Rack::SetPersona

# Inserts in the second position after the default Rails file system resolver. This will keep it
# from being placed after gem-specific view paths resulting in extra file checks for common views.
# By placing after the default Rails file system resolver, it gives priority to persona-specific
# templates then looks for shared ones.
ActionController::Base.view_paths.insert(1, Personas::SharedPersonaFileSystemResolver.new)
Dir["#{Rails.root}/app/models/persona/*.rb"].each { |file| require file }
