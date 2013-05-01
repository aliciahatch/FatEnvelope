class ProgramOverviewController < ApplicationController
  def index
  	@school = School.find(params["id"])
  	@program = @school.program
  	#Were going to set a session variable to remember which school they're working on
   	session[:current_school] = @school.id
  end
end
