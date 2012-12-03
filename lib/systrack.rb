class SystemTrack
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

end
