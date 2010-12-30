require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Avburn" do
  it "should find programmers" do
    Prog.all.should_not be_empty
  end


  describe "FuseStore" do

    it "should behave like hash" do
      fs = FuseStore.new
      fs[:foo] = 2
      fs[:foo].should eql(2)
    end
  end
end
