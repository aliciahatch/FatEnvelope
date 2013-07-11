class HomeController < ApplicationController

	def index
	  if current_user.has_role? :student
			redirect_to(:controller => 'users', :action => 'bootcamp_welcome')
		else
			if current_user.schools.exists?
  			redirect_to dashboard_path
  		else
  			redirect_to getting_started_path
  		end
		end
		
	end

end
