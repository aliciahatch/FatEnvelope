class HomeController < ApplicationController

	def index
	  if current_user.has_role? :student
			redirect_to(:controller => 'users', :action => 'bootcamp_welcome')
		else
			redirect_to(:controller => 'users', :action => 'dashboard')
		end
		
	end

end
