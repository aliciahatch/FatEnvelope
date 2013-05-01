module ApplicationHelper

	def is_paid(uid)
		@result = Subscription.where('user_id = '+uid)
		if(@result.length > 0)
			return true
		else
			return false
		end
	end
	
	def get_subscription(uid)
		@result = Subscription.where('user_id = '+uid)
		if(@result.length > 0)
			return @result
		else
			return false
		end
	end

end
