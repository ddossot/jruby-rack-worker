require 'sidekiq/cli'
require 'logger'

module Sidekiq
  class JRubyWorker

    def self.start
      @logger = Logger.new(STDOUT)

      at_exit { exit! }

      @logger.info '*** Starting Sidekiq'
      @cli = Sidekiq::CLI.instance
      @cli.parse []
      @cli.run
      @logger.info '*** Sidekiq is running'
    end

    def self.exit!
      @logger.info '*** Sending TERM signal to Sidekiq'
      # see https://github.com/mperham/sidekiq/wiki/Signals#term
      @cli.send(:handle_signal, 'TERM')
      # Sidekiq has 8 seconds to finish, let's wait 10 like Heroku
      sleep 10
    end

  end
end
