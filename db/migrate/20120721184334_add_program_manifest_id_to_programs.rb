class AddProgramManifestIdToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :program_manifest_id, :integer
  end
end
