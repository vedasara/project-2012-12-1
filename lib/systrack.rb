require 'mongoid'

	Mongoid.configure do |config|
  		config.master = Mongo::Connection.from_uri("mongodb://localhost:27017").db('system_track')
	end


class SystemTrack


	include Mongoid::Document
	field :command_start_time

	def load_average
		first_minute = uptime.match(/(?<=average..).+?(?=,)/).to_s
	end

	def uptime
		@uptime = `uptime`
	end

	def date
		Time.now
	end

	def extract_date
		date.match(/^\S+/).to_s
	end

	def start_time
		time = uptime.match(/^\S*/).to_s
	end

	def system_up
		up = uptime.match(/(?<=up..).+?(?=,)/).to_s
	end

	def boot_time 
		boot_array = `who -b`.split; boot_array[2].to_s + " " + boot_array[3].to_s
	end


end
