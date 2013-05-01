class PickSchoolController < ApplicationController


  def index
		@schools = School.all 
		@schoolsselected = current_user.schools.length
		@result = Subscription.where('user_id = '+current_user.id.to_s)
		if @result.length >0
			@currentsub = @result.first 
			@maxnum = @currentsub.plan.numofschools
		end
  end
  
  def new
		@schoolid = params[:user][:school_id]
		adder = School.find(@schoolid)
		current_user.schools << adder
		redirect_to :action=> :index
  end
  
  def delete_school_association
  	schoolid = params['id']
		current_user.schools.delete(schoolid)
  	
  end
  
end
