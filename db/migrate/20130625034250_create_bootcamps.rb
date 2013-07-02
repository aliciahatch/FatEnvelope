class CreateBootcamps < ActiveRecord::Migration
  def change
    create_table :bootcamps do |t|
      t.date :bootcamp_date

      t.timestamps
    end
  end
end
