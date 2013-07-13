class AddWordToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :word, :string
  end
end
