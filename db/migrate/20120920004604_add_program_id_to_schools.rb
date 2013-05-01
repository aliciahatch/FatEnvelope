class AddProgramIdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :program_id, :integer
  end
end
