require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Orange::ModelResource do

  it "should extend class inheritable attributes" do
    Orange::ModelResource.should be_a_kind_of(ClassInheritableAttributes)
  end
  
  it "should have a model class when calling use" do
    a = MockModelResourceOne.new
    b = MockModelResourceTwo.new
    MockModelResourceOne.model_class.should equal MockCarton
    a.model_class.should equal MockCarton
    MockModelResourceTwo.model_class.should equal MockCartonTwo
    b.model_class.should equal MockCartonTwo
  end
  
  it "have a usable view method" do
     a = MockModelResource.new
     a.should respond_to(:view)
  end
  
  it "should call index or show by default for an orange packet" do
    c = Orange::Core.new
    c.load(MockModelResourceOne.new, :mocked)
    p = Orange::Packet.new(c, {})
    p2 = Orange::Packet.new(c, {})
    p2['route.resource_id'] = 1
    lambda {
      c[:mocked].view(p)
    }.should raise_error(RuntimeError, "I see you're using index")
    lambda {
      c[:mocked].view(p2)
    }.should raise_error(RuntimeError, "I see you're using show")
  end
  
  it "should send the mode to the appropriate method" do
    c = Orange::Core.new
    c.load(MockModelResourceOne.new, :mocked)
    p = Orange::Packet.new(c, {})
    lambda {
      c[:mocked].view(p, :mode => :other)
    }.should raise_error(RuntimeError, "I see you're using other")
  end
  
  it "shouldn't give a shit" do
    lambda{
      MockModelResource.shit
    }.should raise_error(NoMethodError)
  end
  
  it "should call find_one if calling view_opts with is_list false" do
    a= MockModelResourceOne.new
    lambda{
      a.view_opts(Orange::Packet.new(Orange::Core.new, {}), :list, false)
    }.should raise_error(RuntimeError, "calling find_one")
  end
  
  it "should call find_list if calling view_opts with is_list true" do
    a= MockModelResourceOne.new
    lambda{
      a.view_opts(Orange::Packet.new(Orange::Core.new, {}), :list, true)
    }.should raise_error(RuntimeError, "calling find_list")
  end
  
  it "should return a hash of options on calling view_opts" do
    a= MockModelResourceFour.new
    c= Orange::Core.new
    p= Orange::Packet.new(c, {})
    lambda{
      a.view_opts(p, :list, true)
    }.should_not raise_error(RuntimeError)
    opts = a.view_opts(p, :list, true, :extra => 'foo')
    opts3 = a.view_opts(p, :list, false, :extra => 'foo')
    opts2 = a.view_opts(p, :list, true, :list => 'banana')
    opts[:props].should == MockCarton.form_props(p['route.context'])
    opts.should have_key(:list)
    opts3.should_not have_key(:list)
    opts.should have_key(:resource)
    opts.should have_key(:model_name)
    opts.should_not have_key(:model)
    opts3.should have_key(:model)
    opts.should have_key(:extra)
    opts3.should have_key(:extra)
    opts[:extra].should == 'foo'
    opts3[:extra].should == 'foo'
    opts[:list].should_not == opts2[:list]
    opts2[:list].should == 'banana'
    opts[:list].should == 'mock_list'
  end
  
  it "should call view_extras after during view_opts" do
    a= MockModelResourceThree.new
    lambda{
      a.view_opts(Orange::Packet.new(Orange::Core.new, {}), :list, true)
    }.should raise_error(RuntimeError, "calling find_extras")
  end
  
  it "should call haml parser with opts on do_view" do
    c= Orange::Core.new
    p= Orange::Packet.new(c, {})
    c.load(MockHamlParser.new, :parser)
    c.load(MockModelResourceFour.new, :mocked)
    parsed = c[:mocked].do_view(p, :test, :extra => 'foo')
    parsed.first.should == 'test.haml'
    parsed.last.should == c[:mocked].view_opts(p, :test, false, :extra => 'foo')
    parsed.last.should_not == c[:mocked].view_opts(p, :test, true, :extra => 'foo')
    parsed.last.should have_key(:extra)
    parsed[1].should equal(p)
  end
  
  it "should call haml parser with opts on do_list_view" do
    c= Orange::Core.new
    p= Orange::Packet.new(c, {})
    c.load(MockHamlParser.new, :parser)
    c.load(MockModelResourceFour.new, :mocked)
    parsed = c[:mocked].do_list_view(p, :test, :extra => 'foo')
    parsed.first.should == 'test.haml'
    parsed.last.should == c[:mocked].view_opts(p, :test, true, :extra => 'foo')
    parsed.last.should_not == c[:mocked].view_opts(p, :test, false, :extra => 'foo')
    parsed.last.should have_key(:extra)
    parsed[1].should equal(p)
  end
  
  it "should call carton's get on find_one(packet, mode, id)" do
    a= MockModelResourceTwo.new
    a.find_one(Orange::Packet.new(Orange::Core.new, {}), :show).should == false
    a.find_one(Orange::Packet.new(Orange::Core.new, {}), :show, 1).should == 'mock_get'
  end
  
  it "should call carton's all on find_list(packet, mode)" do
    a= MockModelResourceTwo.new
    a.find_list(Orange::Packet.new(Orange::Core.new, {}), :show).should == 'mock_all'
  end
  
  it "should return an empty hash by default for find_extras" do
    a= MockModelResourceTwo.new
    a.find_extras(Orange::Packet.new(Orange::Core.new, {}), :show).should == {}
  end
  
  it "should have the view_list method in packet" do
    c = Orange::Core.new
    c.load(MockModelResourceOne.new, :mocked)
    p = Orange::Packet.new(c, {})
    lambda {
      p.view_index(:mocked)
    }.should raise_error(RuntimeError, "I see you're using index")
    lambda {
      p.view_show(:mocked)
    }.should raise_error(RuntimeError, "I see you're using show")
    lambda {
      p.view_other(:mocked)
    }.should raise_error(RuntimeError, "I see you're using other")
  end
end