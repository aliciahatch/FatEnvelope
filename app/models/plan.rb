class Plan < ActiveRecord::Base
  attr_accessible :name, :price, :numofschools
  has_many :subscriptions
  
  def select_value 
    "#{name} - #{price}"
	end
  
end
