class DashboardController < ApplicationController
  require 'open-uri'
  
  before_filter :authenticate_user!
  before_filter :has_school
  
  def index
  	if current_user.schools.count == 1
  		redirect_to :controller => :program_overview, :action => :index, :id => current_user.schools.first and return
  	end
  
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
    end
    
    if current_user.firsttime != false
			current_user.firsttime = false
			current_user.save!
		end
  end
  
  
  def has_school
  	unless current_user.schools.any?
  		redirect_to :controller=>'pick_school', :action=>'index'
  	end
  end
  

  
end
