class HomeController < ApplicationController

	def index
		if current_user.schools.exists?
			redirect_to dashboard_path
			
		else
			redirect_to getting_started_path
		end
	end

end
