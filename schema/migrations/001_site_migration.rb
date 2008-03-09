class SiteMigration < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :domain
    end    
  end

  def self.down
    drop_table :sites
  end
end
