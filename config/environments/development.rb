Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  
  # Blocmarks - User Sign Up feature
  # See https://docs.c9.io/discuss/55034a464731190d00360648
  #config.action_mailer.default_url_options = { host: 'localhost:8080' }
  config.action_mailer.default_url_options = { host: '$IP:$PORT' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  
  # Blocmarks - 3. User Sign In and Out; 37. Authentication Continued
  #
  # If you've double-checked setup_mail.rb and the emails still aren't sending, this could be a great place to work on your debugging skills. There are two common pitfalls here, and adding the following line to your development.rb file will raise errors that should lead you to a successful Google search or mentor conversation:
  #
  # config/environments/development.rb
  #   # Override Action Mailer's 'silent errors' in development
  #   config.action_mailer.raise_delivery_errors = true
  
  # Override Action Mailer's 'silent errors' in development
  config.action_mailer.raise_delivery_errors = true
end
