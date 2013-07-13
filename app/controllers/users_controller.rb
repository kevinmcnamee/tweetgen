class UsersController < ApplicationController

	before_filter :require_login, except: [:new, :create]

	def show
		@user = current_user
		@campaigns = current_user.campaigns
	end


end