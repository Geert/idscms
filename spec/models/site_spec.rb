require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Site do
  
  it "should have a domain" do
    site = Site.create
    site.errors.on(:domain).should_not be_nil
  end

end