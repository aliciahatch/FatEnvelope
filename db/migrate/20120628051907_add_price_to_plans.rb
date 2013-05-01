class AddPriceToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :price, :decimal
  end
end
