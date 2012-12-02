class SystemTrack
	def load_average
		first_minute = uptime.match(/(?<=average..).+?(?=,)/); first_minute[0]
	end

	def uptime
		@uptime = `uptime`
	end

	def extract_date
		date = Time.new.to_s.match(/^\S*/); date[0]
	end

	def start_time
		time = uptime.match(/^\S*/); time[0]
	end

	def system_up
		up = uptime.match(/(?<=up..).+?(?=,)/); up[0]
	end

end
