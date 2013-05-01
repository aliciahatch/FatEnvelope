class CreateSchoolsUsers < ActiveRecord::Migration
  def change
    create_table :schools_users do |t|
      t.integer :school_id
      t.integer :user_id

      t.timestamps
    end
  end
end
