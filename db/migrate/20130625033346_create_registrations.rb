class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :program
      t.integer :price
      t.references :user
      t.date :bootcamp_date

      t.timestamps
    end
    add_index :registrations, :user_id
  end
end
