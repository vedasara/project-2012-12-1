describe "track system" do
	before :all do
    	@fake_uptime = "13:06:08 up  1:29,  1 user,  load average: 0.03, 0.06, 0.06"
	end

	it "should extract average load" do
		@fake_uptime.load_average == 0.03
	end
end
