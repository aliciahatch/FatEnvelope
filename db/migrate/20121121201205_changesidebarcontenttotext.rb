class Changesidebarcontenttotext < ActiveRecord::Migration
  def self.up
    change_table :steps do |t|
      t.change :sidebarcontent, :text
    end
  end
  def self.down
    change_table :steps do |t|
      t.change :sidebarcontent, :string
    end
  end
end
