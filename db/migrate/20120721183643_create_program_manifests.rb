class CreateProgramManifests < ActiveRecord::Migration
  def change
    create_table :program_manifests do |t|
      t.integer :step_id
      t.integer :program_id

      t.timestamps
    end
  end
end
