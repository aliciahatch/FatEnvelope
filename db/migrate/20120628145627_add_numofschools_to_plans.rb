class AddNumofschoolsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :numofschools, :integer
  end
end
