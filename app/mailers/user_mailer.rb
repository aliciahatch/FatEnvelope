class UserMailer < ActionMailer::Base
  default from: "Fat Envelope Essays <info@fatenvelopeessays.com>"
  
  def registration_email(user, registration)
    @user = user
    @registration = registration
    mail(:to => @user.email, :subject => "Thank you for registering with Fat Envelope Essays!");
  end
  
  def registration_email_student(user, registration)
    @user = user
    @registration = registration
    mail(:to => @user.email, :subject => "Thank you for registering with Fat Envelope Essays!");
  end
  
end
