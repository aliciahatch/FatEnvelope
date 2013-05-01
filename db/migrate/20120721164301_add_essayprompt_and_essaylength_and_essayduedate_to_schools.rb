class AddEssaypromptAndEssaylengthAndEssayduedateToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :essayprompt, :string
    add_column :schools, :essaylength, :integer
    add_column :schools, :essayduedate, :datetime
  end
end
