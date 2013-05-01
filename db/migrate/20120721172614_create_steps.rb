class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.integer :type_id
      t.text :instructions
      t.string :video_mp4
      t.string :video_webm
      t.boolean :writing_area
      t.integer :points

      t.timestamps
    end
  end
end
