class Term < ActiveRecord::Base

	#Associations
	belongs_to :campaign
	has_many :tweets

	#Attributes
  attr_accessible :campaign_id, :word, :tone

  def impressions
  	tweets.count
  end

  def follows
  	tweets.where(converted: true).count
  end

  def conversion_rate
  	if follows > 0
	  	follows.to_f / impressions.to_f
	  else
	  	"No Conversions"
	  end
  end

end
