class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :stripetoken, :last4, :num_of_tokens, :name, :firstvisit, :school
	
  #attr_accessor :year_in_school, :program, :status, :school
  #attr_accessible :year_in_school, :program, :status, :school
  attr_accessible :first_name, :last_name, :date_of_birth, :current_school, :current_grade, :parent_first_name, :parent_last_name, :parent_cell_phone, :parent_email, :parent_email_notifications, :parent_text_notifications, :address, :city, :state, :zip_code, :country, :country_code, :telephone
  
  attr_accessor :terms_of_service
  attr_accessible :terms_of_service
  
  validates :first_name, :last_name, :date_of_birth, :current_school, :current_grade, :address, :city, :state, :zip_code, :country, :country_code, :telephone, :presence => true
  validates :current_grade, :numericality => true
  validates :zip_code, :numericality => { :only_integer => true }
  validates :date_of_birth, :format => { :with => /\d\d\d\d-\d\d-\d\d/, :message => "invalid format, must match: YYYY-MM-DD" }
  validates :terms_of_service, :acceptance => true
  
  has_many :subscription
  has_and_belongs_to_many :schools
  
  def stripe_description
    "#{name}: #{email}"
  end

  def update_stripe
    if stripe_id.nil?
      if !stripe_token.present?
        raise "We're doing something wrong -- this isn't supposed to happen"
      end

      customer = Stripe::Customer.create(
        :email => email,
        :description => stripe_description,
        :card => stripetoken
      )
      self.last4 = customer.active_card.last4
      response = customer.update_subscription({:plan => "premium"})
    else
      customer = Stripe::Customer.retrieve(stripe_id)

      if stripe_token.present?
        customer.card = stripetoken
      end

      # in case they've changed
      customer.email = email
      customer.description = stripe_description

      customer.save

      self.last4 = customer.active_card.last4
    end

    self.stripe_id = customer.id
    self.stripetoken = nil
  end
  
end

