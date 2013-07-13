class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.integer :campaign_id

      t.timestamps
    end
  end
end
