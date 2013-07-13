class SessionsController < ApplicationController

	def create
		user = User.from_omniauth(env['omniauth.auth'])
		session[:user_id] = user.id
		if user.campaigns.any?
			redirect_to user, notice: "Signed in."
		else
			redirect_to new_user_campaign_path(user), notice: "Create a Campaign"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: 'Signed Out'
	end

end