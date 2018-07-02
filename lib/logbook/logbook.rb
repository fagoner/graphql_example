require 'logger'
class Logbook
  class << self
    attr_accessor :logger_instance
  end

  def self.logger
    self.logger_instance ||= Logger.new(STDOUT)
  end

  def self.error(message)
    self.logger.error(message)
  end

  def self.info(message)
    self.logger.info(message)
  end

  def self.debug(message)
    self.logger.debug(message)
  end
end