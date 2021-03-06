class ApplicationController < ActionController::Base
  protect_from_forgery

	private

	def load_account
  		@account = Account.find_by_subdomain!(request.subdomain)
	end

	def auto_title
		if request.subdomain.present?
			request.subdomain.titleize
		else
			Rental
		end
	end
	helper_method :auto_title

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize
	  # redirect_to login_url, alert: "Not authorized" if current_user.nil?
	  redirect_to root_url(:subdomain => false), alert: "Not authorized" if current_user.nil? #|| @current_user.account.subdomain != (request.subdomain)
	end
end
