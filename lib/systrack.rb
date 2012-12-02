class SystemTrack
	def load_average
		first_minute = uptime.match (/(?<=average..).+?(?=,)/); first_minute[0]
	end

	def uptime
		@uptime = `uptime`
	end
end
