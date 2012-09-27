require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module ChatRailsette
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/lib)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Swap the ActionDispatch::Flash middleware with the CacheableFlash one
    #config.middleware.swap ActionDispatch::Flash, CacheableFlash::Middleware

    config.middleware.use "Rack::Insight::App",
                          :secret_key => 'boogity-bop-flim-flam-ziggy-drip-lock-hot',
                          :panel_files => [
                                  'active_record_panel',
                                  #'active_resource_panel',
                                  #'cache_panel',
                                  #'log_panel',
                                  #'chat_panel',
                                  #'http_client_panel',
                                  #'message_panel',
                                  #'memory_panel',
                                  #'rails_info_panel',
                                  #'redis_panel',
                                  #'request_variables_panel',
                                  'sql_panel',
                                  #'templates_panel',
                                  #'timer_panel'
                                  # Not really a contender...
                                  #'speedtracer_panel',
                          ]

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.before_initialize do
      Rack::Insight::Config.configure do |config|
        config[:panel_load_paths] << 'rack-insight/chat_panel'
        config[:panel_load_paths] << 'rack-insight/foo'
        config[:verbosity] = Rack::Insight::Logging::VERBOSITY[:low]
        # Note: This must be configured before initialize
        config[:panel_configs][:message] = {:probes => {"Message" => [:class, :profess_love]}}
        config[:panel_configs][:http_client] = {:probes => {"User" => [:class, :do_stuff]}}
        #config[:filtered_backtrace] = true
        #config[:panel_configs][:log_panel] = {:probes => {
        #        "ActiveSupport::BufferedLogger" => [:instance, :add],
        #        "Logger" => [:instance, :add]
        #}}
        #config[:panel_configs][:log_panel] = {:probes => {"ActiveSupport::BufferedLogger" => [:instance, :add]}}
        #config[:panel_configs][:log_panel] = {:probes => {"Logger" => [:instance, :add]}}
      end
    end

    config.after_initialize do
      Rack::Insight::Config.configure do |config|
        config[:logger] = ::Rails.logger
        config[:rails_log_copy] = false
        config[:verbosity] = false # Rack::Insight::Logging::VERBOSITY[:debug]
        config[:filtered_backtrace] = true
        # Note: This will not work after initialize
        #config[:panel_configs][:message] = {:probes => {"Message" => [:class, :profess_love]}}
        #config[:panel_configs][:http_client] = {:probes => {"User" => [:class, :do_stuff]}}
      end
    end

  end
end
