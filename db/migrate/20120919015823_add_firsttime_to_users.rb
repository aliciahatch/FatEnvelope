class AddFirsttimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firsttime, :boolean
  end
end
