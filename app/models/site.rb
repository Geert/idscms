class Site < ActiveRecord::Base
  validates_presence_of :domain
end