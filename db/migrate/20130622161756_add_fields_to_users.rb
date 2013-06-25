class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :current_school, :string
    add_column :users, :parent_first_name, :string
    add_column :users, :parent_last_name, :string
    add_column :users, :parent_cell_phone, :string
    add_column :users, :parent_email, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :country_code, :string
    add_column :users, :telephone, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :current_grade, :decimal
    add_column :users, :parent_email_notifications, :boolean
    add_column :users, :parent_text_notifications, :boolean
    add_column :users, :zip_code, :integer
  end
end
