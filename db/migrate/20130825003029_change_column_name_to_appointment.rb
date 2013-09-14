class ChangeColumnNameToAppointment < ActiveRecord::Migration
  def change
    remove_column :appointments, :type
    add_column :appointments, :description, :string
  end
end
