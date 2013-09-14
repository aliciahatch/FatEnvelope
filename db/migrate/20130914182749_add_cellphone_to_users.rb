class AddCellphoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cellphone, :string
    add_column :users, :parent_phone, :string
  end
end
