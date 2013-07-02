class Registration < ActiveRecord::Base
  belongs_to :user
  attr_accessible :price, :program, :bootcamp_date, :user_id
end
