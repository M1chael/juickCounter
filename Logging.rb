require 'logger'

module Logging

  def logger
    Logging.logger
  end

  def self.logger
    @logger ||= Logger.new("#{File.expand_path(File.dirname(__FILE__))}/log/JC.log", 'weekly')
  end
end