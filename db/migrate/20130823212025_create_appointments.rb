class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.timestamp :date
      t.integer :user_id
      t.string :type
      t.integer :student_id
      t.timestamps
    end
  end
end
