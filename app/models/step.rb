class Step < ActiveRecord::Base
  attr_accessible :instructions, :name, :points, :step_type_id, :video_mp4, :video_webm, :video_poster, :writing_area, :sortorder, :sidebarcontent, :sidebarcontentbool
  has_many :program_manifests, :dependent => :destroy
  has_many :programs, :through => :program_manifests
  has_one :step_type
  
  default_scope order('sortorder ASC')
  
  def isComplete (school)
  	#Check to make sure we have values, if we do, then see if ours is in it.
  	if(!school.completed_steps.nil?)
	  	completedSteps = school.completed_steps.split( /, */ )
	  	isCompleted = completedSteps.include?(self.id.to_s)
  	return isCompleted
  	#else we should return false, since there arent any completed.
  	else
  		return false
  	end
  end
end
