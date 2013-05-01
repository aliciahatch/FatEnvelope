class Admin < ActiveRecord::Base
  devise :database_authenticatable, :rememberable
  attr_accessible :email, :password, :password_confirmation, :god_mode, :reports_only
end