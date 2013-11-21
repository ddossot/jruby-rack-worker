require 'sidekiq'
require 'sidekiq/util'

module Sidekiq
  class Shutdown < Interrupt; end
  
  class JRubyWorker

    def self.start
      @logger = Logger.new(STDOUT)

      at_exit { exit! }

      require 'celluloid/autostart'
      require 'celluloid'
      require 'sidekiq/manager'
      require 'sidekiq/scheduled'
      require 'sidekiq/launcher'

      options = Sidekiq.options
      options[:queues] << 'default'

      @logger.info '*** Starting Sidekiq'
      @launcher = Sidekiq::Launcher.new(options)
      @launcher.run
      @logger.info '*** Sidekiq is running'
    end

    def self.exit!
      @logger.info '*** Stopping Sidekiq'
      @launcher.stop

      @logger.info '*** Stopping Celluloid'
      Celluloid.shutdown
    end

  end
end
