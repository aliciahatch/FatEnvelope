class AddVideoPosterToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :video_poster, :string
  end
end
