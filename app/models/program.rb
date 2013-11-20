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
  
  def self.get_price(program)
    @program_price = 0
    case program
    when '1'
      # DETERMINE YOUR COMPETITIVE ESSAY
      @program_price = 199.00
    when '2'
      # COMPLETE ESSAY PACKAGE
      @program_price = 850.00
    when '3'
      # DELUXE ESSAY PACKAGE
      @program_price = 1150.00
    when '4'
      # BOOTCAMP
      @program_price = 950.00
    end
    return @program_price
  end
  
  def self.get_description(program)
    @program_desc = ''
    case program
    when '1'
      @program_desc = "DETERMINE YOUR COMPETITIVE ESSAY"
    when '2'
      @program_desc = "COMPLETE ESSAY PACKAGE"
    when '3'
      @program_desc = "DELUXE ESSAY PACKAGE"
    when '4'
      @program_desc = "BOOTCAMP"
    end
    return @program_desc
  end
  
end
