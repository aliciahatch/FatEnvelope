class AddColumnToAppointment < ActiveRecord::Migration
  def change
    remove_column :appointments, :date
    add_column :appointments, :date, :date
    add_column :appointments, :hour, :integer
  end
end
