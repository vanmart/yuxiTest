require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YuxiTest
  class Application < Rails::Application
    config.time_zone = 'Bogota'

    config.to_prepare do
      Devise::SessionsController.layout "layoutvideo"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "layoutvideo" }
      Devise::ConfirmationsController.layout "layoutvideo"
      Devise::UnlocksController.layout "layoutvideo"
      Devise::PasswordsController.layout "layoutvideo"
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
