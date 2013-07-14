class PublicController < ApplicationController

	def index
	end

	def search
		user = current_user
		client = TwitterClient.new(current_user.token, current_user.secret)
		@tweets = client.tweets_for_term(params[:word])
		respond_to do |format|
			format.js
		end
	end

end