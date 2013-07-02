# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :first_name => 'First', :last_name => 'User', :date_of_birth => '1990-01-01', :current_school => 'my school', :current_grade => 3.5, :address => 'my address', :city => 'my city', :state => 'MS', :zip_code => '12312', :country => "US", :country_code => '57', :telephone => '123123123', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.first_name
user.add_role :admin
