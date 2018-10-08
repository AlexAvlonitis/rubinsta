require 'logger'

module Rubinsta
  class Component
    def initialize(driver)
      @driver = driver
      @logger = Logger.new(STDOUT)
    end

    def execute
      logger.info("running #{self.to_s}")
    end

    private

    attr_reader :driver, :logger
  end
end
