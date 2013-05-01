class AddSidebarcontentAndSidebarcontentboolToStep < ActiveRecord::Migration
  def change
    add_column :steps, :sidebarcontent, :string
    add_column :steps, :sidebarcontentbool, :boolean
  end
end
