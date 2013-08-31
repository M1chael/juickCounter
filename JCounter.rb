#!/usr/bin/env ruby
# encoding: utf-8

require 'net/http'
require 'json'
require 'time'
require_relative 'Logging'

class JCounter

	include Logging

	def initialize
		logger.info('---====== S T A R T E D =====---')
		wdays = Array.new(7, 0)
		@date = ''
		for i in 1..131072
			uri = URI("http://api.juick.com/messages?page=#{i}")
			res = Net::HTTP.get_response(uri)
			JSON.parse(res.body.gsub('	', ' ')).each {|msg|
				dcTime = Time.parse(msg['timestamp']) + 4 * 60 * 60 # Default City Time
				wdays[dcTime.wday - 1] += 1
				if i % 2048 == 0
					@date = "#{dcTime.day}.#{dcTime.month}.#{dcTime.year}"
				end
			}
			if i % 2048 == 0
				logger.info("#{i} pages, #{@date}, #{wdays.inspect}")
			end		
		end
	end

end

JCounter.new