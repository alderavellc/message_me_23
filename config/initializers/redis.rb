require 'redis'

REDIS = Redis.new(
  url: ENV['REDIS_TLS_URL'] || ENV['REDIS_URL']
)

# Optional: Log Redis status on startup
begin
  REDIS.ping # This tests if Redis is responding
  Rails.logger.info "Connected to Redis successfully."
rescue => e
  Rails.logger.error "Redis connection failed: #{e.message}"
end
