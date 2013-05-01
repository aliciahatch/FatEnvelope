class CreateStepTypes < ActiveRecord::Migration
  def change
    create_table :step_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
