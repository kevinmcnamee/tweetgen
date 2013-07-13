class Tweet < ActiveRecord::Base

	#Associations
	belongs_to :term

	#Attributes
  attr_accessible :converted, :favorited, :owner_uid, :term_id, :uid, :created
end
