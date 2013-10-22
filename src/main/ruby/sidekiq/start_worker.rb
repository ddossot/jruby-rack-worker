require 'jruby/rack/worker/logger'
begin
  require 'sidekiq/jruby_worker'
  Sidekiq::JRubyWorker.start
rescue => e
  JRuby::Rack::Worker.log_error(e) || raise
end