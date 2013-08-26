#!/usr/bin/env ruby
# encoding: utf-8

require 'net/http'
require 'json'
require_relative 'Logging'

class JCounter

	include Logging

	def initialize
		for i in 1..1
			uri = URI("http://api.juick.com/messages?page=#{i}")
			res = Net::HTTP.get_response(uri)
			puts JSON.parse(res.body)[0]
		end
	end

end

JCounter.new