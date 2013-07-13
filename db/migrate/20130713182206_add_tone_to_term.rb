class AddToneToTerm < ActiveRecord::Migration
  def change
    add_column :terms, :tone, :string
  end
end
