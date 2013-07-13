class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :term_id
      t.string :owner_uid
      t.boolean :favorited
      t.boolean :converted

      t.timestamps
    end
  end
end
