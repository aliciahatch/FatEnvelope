class RegistrationController < ApplicationController
  
  def new
    if params[:program].blank? or (not ['1','2','3', '4'].include?(params[:program]))
      redirect_to :back
    else
      @program = params[:program]
      @program_price = Program.get_price(@program)
      @program_description = Program.get_description(@program)
      @bootcamps = Bootcamp.where(['bootcamp_date >= ?', Time.now])
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
         Stripe.api_key = "sk_test_Gv4s6k0leOc5eKPnWRngHWtA"
        token = params[:stripeToken]
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          charge = Stripe::Charge.create(
            :amount => (Program.get_price(params[:program]).to_i * 100), # amount in cents, again
            :currency => "usd",
            :card => token,
            :description => "registration to the program: #{Program.get_description(params[:program])} by the user: #{@user.first_name} #{@user.last_name} with email: #{@user.email}"
            )
          @user.save
          @user.add_role "student"
          @registration = nil
          if params[:bootcamp_date].blank?
            @registration = Registration.create(:program => Program.get_description(params[:program]), :price => (Program.get_price(params[:program]).to_i * 100), :user_id => @user.id)
          else
            @registration = Registration.create(:program => Program.get_description(params[:program]), :price => (Program.get_price(params[:program]).to_i * 100), :user_id => @user.id, :bootcamp_date => params[:bootcamp_date])
          end
          UserMailer.registration_email(@user, @registration).deliver
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
  
  def successful
    redirect_to '/users/sign_in', :notice => "Thank you for registering with Fat Envelope Essays.  You will receive a confirmation email with login details.  To access the Fat Envelope Essay System, enter your login details here:"
  end
  
end
