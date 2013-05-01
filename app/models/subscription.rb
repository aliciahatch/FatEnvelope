class Subscription < ActiveRecord::Base

 attr_accessor :stripe_card_token
 attr_accessible :plan_id, :stripe_customer_token, :user_id, :stripe_card_token, :user
  
  belongs_to :plan
  belongs_to :user

require 'net/http'
  
	def save_with_payment(stripe_card_token, user_id, plan_id, num_of_tokens, stripe_customer_token, price)
    if valid?
	    	if stripe_customer_token.nil?
				customer = Stripe::Customer.create(description: user_id, card: stripe_card_token)
				customer_token = customer.id
			else
				customer_token = stripe_customer_token
			end
			
			
			
			charge = Stripe::Charge.create(
				:amount => price,
				:currency => "usd",
				:customer => customer_token,
				:description => "Customer ID: #{user_id}"
			)
	
			
			
			new_amount_tokens = num_of_tokens.to_i + plan_id.to_i
			#We can always update these pieces of info
			User.update(user_id, :num_of_tokens => new_amount_tokens, :stripetoken => customer_token)
			#Only update the last 4 if they change/add a credit card
			if stripe_customer_token.nil?
				User.update(user_id,:last4 => customer[:active_card][:last4])
			end
			
			self.stripe_customer_token = customer_token
			self.plan_id = plan_id
			self.user_id = user_id
			
			#add the panam stuff here to ensure credentials.
			
			
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
  

end
