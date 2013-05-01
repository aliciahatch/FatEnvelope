class ProgramController < ApplicationController
  def index
  	@school = School.find(params[:schoolId])
  	@program = Program.find(@school.program_id)
  	@step = Step.find(params[:id])
  	
  	@isCompleted = false
  	if !@school.completed_steps.nil?
  		completedSteps = @school.completed_steps.split( /, */ )
  		@isCompleted = completedSteps.include?(params[:id])
  	end
  end
  
  
  def addCompletedStep
	@school = School.find(params[:schoolId])
  	@step = Step.find(params[:id])
  	
  	if !@school.completed_steps.nil?
  		completedSteps = @school.completed_steps.split( /, */ )
  		if !completedSteps.include?(params[:id])
			completedSteps << @step.id
		end
  	else
  		completedSteps = [@step.id]
  	end
		puts 'completesteps'
		puts @completedSteps
		completedStepsString = completedSteps.join(',')
	@school.update_attribute(:completed_steps, completedStepsString)
	
	
		# API CALL FOR THE EN
		uri = URI.parse("https://panameducation.com/app/sso/login")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		
		request = Net::HTTP::Post.new(uri.request_uri)
		queryparams = {
			"token" => session[:sso_token],
			"email" => "demouser@example.com",
		}
		request.set_form_data(queryparams)
		response = http.request(request)
	

		
		puts request
		puts '//////////////////////////////////////////////////////////'
		puts response

		
		



  	
  	respond_to do |format|
  		format.html { render :json =>  @school }
        format.json { render :json =>  @step }
    end
  end
  
  
end
