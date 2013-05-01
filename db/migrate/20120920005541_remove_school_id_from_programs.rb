class RemoveSchoolIdFromPrograms < ActiveRecord::Migration
  def up
    remove_column :programs, :school_id
      end

  def down
    add_column :programs, :school_id, :integer
  end
end
