class HomeController < ApplicationController

	def index
	  if current_user.has_role? :student
			redirect_to(:controller => 'users', :action => 'dashboard')
		else
			redirect_to(:controller => 'users', :action => 'index')
		end
		
	end

end
