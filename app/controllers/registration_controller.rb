class RegistrationController < ApplicationController
  
  def new
    if params[:program].blank? or (not ['1','2','3'].include?(params[:program]))
      redirect_to :back
    else
      case params[:program]
      when '1'
        @program_desc = "DETERMINE YOUR COMPETITIVE ESSAY "
        @program_price = 350.00
      when '2'
        @program_desc = "COMPLETE ESSAY PACKAGE"
        @program_price = 850.00
      when '3'
        @program_desc = "DELUXE ESSAY PACKAGE"
        @program_price = 1150.00
      end
      @user = User.new
    end
  end
  
end
