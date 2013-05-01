class GettingStartedController < ApplicationController
  def index
  
  	if current_user.schools.any?
  		@buttonClass = "btn btn-primary btn-large"
  	else
  		@buttonClass = "btn btn-primary btn-large disabled"
  	end
  	
  	if current_user.schools.exists?
  		@duedate = current_user.schools.first.admission_deadline
  	end
  	
  	@sub = Subscription.where('user_id = '+current_user.id.to_s)

		if @sub.length >0
			@currentsub = @sub.first 
			if !@currentsub.plan.nil?
				@maxnum = @currentsub.plan.numofschools
			end
		end
  	
  end
end
