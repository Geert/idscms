require 'rubygems'
require 'spec/rake/spectask'
require File.join(File.dirname(__FILE__), "..", "spec", "spec_helper")
require 'spec/mocks'
require 'spec/story'

require 'merb_rspec'

class Merb::Test::RspecStory
  include Merb::Test::ControllerHelper
end

Dir['stories/steps/**/*.rb'].each do |steps_file|
  require steps_file
end
