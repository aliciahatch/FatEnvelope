class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @subscription = Subscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subscription }
    end
  end


  def new
  	@user_id = current_user.id
    @subscription = Subscription.new
  end

  def create
  	stripe_card_token = params[:subscription][:stripe_card_token]
  	stripe_customer_token = params[:subscription][:stripe_customer_token]
  	user_id = current_user.id
  	plan_id = params[:number_of_schools]
  	num_of_tokens = current_user.num_of_tokens

  	
  	if plan_id = 1
  		price = 20000
  	elsif plan_id = 2
  		price = 37500
  	elsif plan_id = 3
  		price = 55000
  	elsif plan_id = 4
  		price = 70000
  	elsif plan_id = 5
  		price = 80000
  	end
  	
    @subscription = Subscription.new
    if @subscription.save_with_payment(stripe_card_token, user_id, plan_id, num_of_tokens, stripe_customer_token, price)
# API CALL FOR THE EN
		#https://panameducation.com/api/students/enroll?api_login=64076818&api_password=YED8WUytErkPur8dLHZQyOWiF&fname=Donald&lname=Duck&email=donald.duck%40example.com&sku=07501-TOEFL-PT&amount=99.00&simple_signup=1&test=1
		uri = URI.parse("https://panameducation.com/api/students/enroll")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		
		request = Net::HTTP::Post.new(uri.request_uri)
		queryparams = {
	    	"api_login"       => '64076818',
	    	"api_password"    => 'YED8WUytErkPur8dLHZQyOWiF',
	    	"test"            => '0',
	    	"fname"           => current_user.name,
	    	"lname"           => ' ',
	    	"email"           => current_user.email,
	    	#"country"         => 'United States',
	    	#"cell_cc"         => '1',
	    	#"cell"            => '5555555555',
	    	#"billing_fname"   => 'Alicia',
	    	#"billing_lname"   => 'Hatch',
	    	#"card_number"     => '4111111111111111',
	    	#"card_code"       => '123',
	    	#"card_expiration" => '09 2013',
	    	"sku"             => '07421-TOEFL-PP',
	    	"amount"          => '00.00',
	    	"no_welcome_email"=> '0',
	    	"grade"           => '12',
	    	"school"          => 'FWHS',
	    	"purpose"         => 'Testing',
	    	"simple_signup"   => 1,
	    	"test"            => 1
    	}
    	
    	request.set_form_data(queryparams)
    	response = http.request(request)
    	puts queryparams
    	puts '//////////////////////////////////////////'
    	puts 'response'+response.body
    
      redirect_to :root, :notice => "Thank you for your purchase!"
    else
      render :new
    end
  end


  def show
    @subscription = Subscription.find(params[:id])
  end
  
  


end