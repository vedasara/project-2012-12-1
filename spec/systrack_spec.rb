require './lib/systrack'

describe "track system" do
	before :all do
    	@fake_uptime = "13:06:08 up  1:29,  1 user,  load average: 0.03, 0.06, 0.06"
    	@system = SystemTrack.new
	end
	before :each do
    	@system.stub(:uptime).and_return(@fake_uptime)
  	end

	it "should extract average load" do
		@system.load_average.should == "0.03"
	end
end
