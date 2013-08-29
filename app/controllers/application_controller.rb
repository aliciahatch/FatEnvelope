class ApplicationController < ActionController::Base
	include ApplicationHelper
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  before_filter :instantiate_controller_and_action_names
  before_filter :ensuresso
  
  def after_sign_in_path_for(resource)
      if current_user.has_role? :student
    			url_for(:controller => '/users', :action => 'dashboard')
    	elsif current_user.has_role? :admin
    	    url_for(:controller => '/users', :action => 'index')
  	  else
    			url_for(:controller => '/users', :action => 'dashboard')
    	end
    end
 
  def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
  end
  
  def ensuresso
  	if user_signed_in?
  	if is_paid(current_user.id.to_s)
  	if session[:sso_token].nil?
		# API CALL FOR THE EN
		uri = URI.parse("https://panameducation.com/app/sso/token")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		
		request = Net::HTTP::Post.new(uri.request_uri)
		queryparams = {
			"api_login" => "64076818",
			"api_password" => "YED8WUytErkPur8dLHZQyOWiF",
			"email" => "demouser@example.com",
		}
		request.set_form_data(queryparams)
		response = http.request(request)
		res = JSON.parse(response.body);
		
		if res['code'] == 0
			puts 'got sso code: '+res['result']['token']
			session[:sso_token] = res['result']['token']
		end
		
		
		puts '//////////////////////////////////////////////////////////'
		puts current_user.email.to_s
		puts session[:sso_token]
		
	end	
	end
	end
	
  end
  
  
end
