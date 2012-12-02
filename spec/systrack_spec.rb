require './lib/systrack'

describe "track system" do
	before :all do
  	@fake_uptime = "13:06:08 up  1:29,  1 user,  load average: 0.03, 0.06, 0.06"
  	@fake_date = "2012-12-02 20:43:24 +0100"
  	@system = SystemTrack.new
	end

	before :each do
  	@system.stub(:uptime).and_return(@fake_uptime)
  	@system.stub(:date).and_return(@fake_date)
  	end

	it "should extract average load" do
		@system.load_average.should == "0.03"
	end

	it "should extract date" do
		@system.extract_date.should == "2012-12-02"
	end
  
end
