class Campaign < ActiveRecord::Base
  
  #Associations
  belongs_to :user 
  has_many :terms

  accepts_nested_attributes_for :terms

  #Attributes
  attr_accessible :user_id, :terms_attributes


end
