class AddSortorderToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :sortorder, :integer
  end
end
