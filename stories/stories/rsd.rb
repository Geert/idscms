require File.join(File.dirname(__FILE__), "../helper")

# with_steps_for :rsd do
#   run File.expand_path(__FILE__).gsub(".rb",""), :type => Merb::Test::RspecStory
# end

Story "Providing RSD (http://en.wikipedia.org/wiki/Really_Simple_Discovery)", %{
  As a RSD-enabled client
  I want to be able to know about the available API's 
  So that I'm able to us the service without asking the user for input 
}, :type => Merb::Test::RspecStory do

  Scenario "Retreiving the RSD file" do
    Given "a site with the domain", "avikopotato.nl" do |domain|
      @site = Site.new(:domain => domain)
    end
  end

end


  
  #   Scenario: Retreiving the RSD file
  # Given a site with the domain avikopotato.nl
  # When I go to http://avikopotato.nl
  # Then I should find the RSD link tag in the header
  # When I follow the href from the RSD link tag
  # Then I should find the rsd xml file