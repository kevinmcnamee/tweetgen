class CampaignsController < ApplicationController

	def new
		@user = current_user
		@campaign = current_user.campaigns.build
		@campaign.terms.build
	end

	def create
		@campaign = current_user.campaigns.new(params[:campaign])
		if @campaign.save
			redirect_to current_user
		end
	end

	def edit
		@campaign = current_user.campaigns.find(params[:id])
	end

	def update
		campaign = current_user.campaigns.find(params[:id])
		campaign.update_attributes!(params[:campaign])
		redirect_to user_path(current_user), notice: "Terms Update!"
	end

	def favorite
		campaign = current_user.campaigns.find(params[:id])
		client = TwitterClient.new(current_user.token, current_user.secret)
		if client.initialize_campaign_action(campaign)
			redirect_to user_path(current_user), notice: "Campaign tweets favorited"
		else
			flash[:error] = "Something broke yo"
			render :back
		end
	end



end