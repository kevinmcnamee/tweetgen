class TwitterClient
	attr_accessor :client

	def initialize(token, secret)
		@client = Twitter::Client.new(
			oauth_token: token, 
			oauth_token_secret: secret
		)
	end

	def initialize_campaign_action(campaign)
		tweets = []
		campaign.terms.each do |term|
			tweets << tweets_for_term(term)
		end
		tweets
		tweets = tweets.flatten.uniq.keep_if { |tweet| !tweet[:been_favorited] }
		favorite_tweets(tweets)
	end

	def tweets_for_term(term)
		tweets = 	client.search(search_term(term), count: 10, result_type: "recent").results.map do |result|
								{
									uid: 						result.id,
									owner_uid: 			result.user.id,
									created: 				result.created_at,
									been_favorited: result.favorited,
									term_id: 				term.id
								}
							end
		tweets
	end

	def favorite_tweets(tweets)
		tweets.each do |t|
			client.favorite(t[:uid])
			Tweet.create(uid: 							t[:uid],
									favorited: 					true,
									owner_uid: 					t[:owner_uid],
									term_id: 						t[:term_id],
									created: t[:created])	
		end
	end

	def search_term(term)
		if term.tone 
			"#{term.word} #{term.tone}"
		else
			term.word
		end
	end

end