class Program < ActiveRecord::Base
  attr_accessible :name, :step_ids
  has_many :program_manifests, :dependent => :destroy
  has_many :steps, :through => :program_manifests
  has_many :schools
  
  def percentComplete (school)
  	if !school.nil? 
  		if !school.completed_steps.nil?
  		total = []
  		complete = []
  		self.steps.each do|step|
  			total << step.id
  		end
  		school.completed_steps.split( /, */ ).each do|completedStep|
  			complete << completedStep.to_i
  		end
	  	
	  	
	  	
	  	completedAmount = total.count - (total-complete).count
	  	
	  	return ((Float(completedAmount) / Float(total.count)) * 100).to_int
	  	else
	  		return '0'
	  	end
  	else
  		return '0'
  	end
  end
end
