require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1, url: "redis://#{ENV['DB_HOST']}:#{ENV['DB_PORT']}", network_timeout: 5 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1, url: "redis://#{ENV['DB_HOST']}:#{ENV['DB_PORT']}", network_timeout: 5 }
end