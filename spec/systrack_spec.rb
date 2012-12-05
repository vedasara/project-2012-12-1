require './lib/systrack'

describe "track system" do
	before :all do
  	@fake_uptime = "13:06:08 up  1:29,  1 user,  load average: 0.03, 0.06, 0.06"
  	@fake_date = "2012-12-02 20:43:24 +0100"
    @fake_boot = "system boot  2012-12-05 21:12"
  	@system = SystemTrack.new
	end

	before :each do
  	@system.stub(:uptime).and_return(@fake_uptime)
  	@system.stub(:date).and_return(@fake_date)
    @system.stub(:boot).and_return(@fake_boot)
	end

  describe "collecting data" do

    it "should extract time when command had run" do
      @system.start_time.should == "13:06:08"
    end

    it "should extract up time" do
      @system.system_up.should == "1:29"
    end
    
  	it "should extract average load" do
  		@system.load_average.should == "0.03"
  	end

  	it "should extract date" do
  		@system.extract_date.should == "2012-12-02"
  	end

    it "should extract system boot time" do
      @system.boot_time.should == "2012-12-05 21:12"
    end

  end

  describe "write data to database" do

    it "should write command start time to db" do
      s = SystemTrack.new
      s.command_start_time = "13:06:08"
      s.save
    end

    it "should retreive data from mongo" do
      s = SystemTrack.where(:command_start_time => "13:06:08").first
      s.command_start_time.should == "13:06:08"
      s.delete
    end






  end
  
end
