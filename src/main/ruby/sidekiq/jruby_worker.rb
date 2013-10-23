require 'sidekiq/cli'
require 'logger'

module Sidekiq
  class JRubyWorker

    def self.start
      @logger = Logger.new(STDOUT)
      @logger.info '*** Starting Sidekiq'
      @cli = Sidekiq::CLI.instance
      @cli.parse []
      @cli.run
      @logger.info '*** Sidekiq is running'
    end

    def self.exit!
      @logger.info '*** Sending INT signal to Sidekiq'
      @cli.handle_signal('INT')
    end

  end
end
