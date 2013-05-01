class RemoveProgramIdFromSchools < ActiveRecord::Migration
  def up
    remove_column :schools, :program_id
      end

  def down
    add_column :schools, :program_id, :integer
  end
end
