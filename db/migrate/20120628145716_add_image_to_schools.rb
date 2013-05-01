class AddImageToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :image, :text
  end
end
