class RegistrationController < ApplicationController
  
  def new
    if params[:program].blank? or (not ['1','2','3'].include?(params[:program]))
      redirect_to :back
    else
      @program = params[:program]
      @program_price = Program.get_price(@program)
      @program_description = Program.get_description(@program)
      @user = User.new
    end
  end
  
  def validate_user
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.valid?
        format.json  {render :json => { :status => 'success'}.to_json}
      else
        html = render_to_string(:partial => 'errors', :layout => false, :locals => {:user => @user})
        format.json  {render :json => { :status => 'failure', :html => html}.to_json}
      end
    end
  end
  
  def charge_and_create_user
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.valid? and params[:program]
        # Stripe.api_key = "sk_test_vBT4w1H2Og5pa1cpsTG94ynU"
        token = params[:stripeToken]
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          #charge = Stripe::Charge.create(
          #  :amount => (Program.get_price(params[:program]).to_i * 100), # amount in cents, again
          #  :currency => "usd",
          #  :card => token,
          #  :description => "registration to the program: #{Program.get_description(params[:program])} by the user: #{@user.first_name} #{@user.last_name} with email: #{@user.email}"
          #  )
          # @user.save
          format.json  {render :json => { :status => 'success'}.to_json}
        rescue Stripe::CardError => e
          # The card has been declined
          format.json  {render :json => { :status => 'failure', :html => '<div class="alert alert-error">The card has been declined.</div>'}.to_json}
        end
      else
        html = render_to_string(:partial => 'errors', :layout => false, :locals => {:user => @user})
        format.json  {render :json => { :status => 'failure', :html => html}.to_json}
      end
    end
  end
  
  def pending
    authorize! :manage_registration, :all
    #@users = User.where(:status => 'pending')
    @users = User.all
  end
  
  def add_details
    authorize! :manage_registration, :all
    @user = User.find(params[:user_id])
    #if @user != nil and @user.status != 'pending'
    #  redirect_to :back
    #end
  end
  
  def update_details
    authorize! :manage_registration, :all
    @user = User.find(params[:user_id])
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    #@user.status = 'active'
    if @user.save
      flash[:notice] = 'User registration info has been updated successfully. An email confirmation has been sent to the user'
      redirect_to(:controller => 'registration', :action => 'pending' )
    else
      render 'add_details'
    end
  end
  
end
