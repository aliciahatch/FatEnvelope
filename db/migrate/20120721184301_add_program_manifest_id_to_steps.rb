class AddProgramManifestIdToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :program_manifest_id, :integer
  end
end
