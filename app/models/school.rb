class School < ActiveRecord::Base
  attr_accessible :address, :admission_deadline, :name, :ranking, :state, :zip, :image, :program_id, :completed_steps, :essayprompt
  has_and_belongs_to_many :users
  belongs_to :program
  
  def timeTill
  	deadline = self.admission_deadline.to_time()
  	
  	#return (deadline - Time.now).to_i()
  	#return time_ago_in_words(deadline, false)
  	return deadline
  	
  end
  
end
