class AddCompletedStepsToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :completed_steps, :string
  end
end
