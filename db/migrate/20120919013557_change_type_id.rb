class ChangeTypeId < ActiveRecord::Migration
  def self.up
    rename_column :steps, :type_id, :step_type_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
