class UsersRoles < ActiveRecord::Base
  attr_accessible :role_id, :user_id
  has_one :role
end
