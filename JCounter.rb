#!/usr/bin/env ruby
# encoding: utf-8

require 'net/http'
require 'json'
require 'time'
require_relative 'Logging'

class JCounter

	include Logging

	def initialize
		for i in 1..1
			uri = URI("http://api.juick.com/messages?page=#{i}")
			res = Net::HTTP.get_response(uri)
			JSON.parse(res.body).each {|msg|
				dcTime = Time.parse(msg['timestamp']) + 4 * 60 * 60 # Default City Time
				puts "#{dcTime.wday}"
			}
		end
	end

end

JCounter.new