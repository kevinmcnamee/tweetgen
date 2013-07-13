class AddCreatedToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :created, :datetime
  end
end
