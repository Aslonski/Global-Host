module SessionsHelper

	# Returns the current logged-in user (if any).
	def current_user
	  @current_user ||= User.find_by(id: session[:user_id])
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
	  !current_user.nil?
	end

	def authorize!
	  redirect_to new_session_path unless logged_in?
	end

	def self_authenticate(id)
		redirect_to user_path(@current_user) unless current_user.id == id.to_i
	end

end
