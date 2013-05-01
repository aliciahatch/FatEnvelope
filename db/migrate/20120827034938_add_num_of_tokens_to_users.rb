class AddNumOfTokensToUsers < ActiveRecord::Migration
  def change
    add_column :users, :num_of_tokens, :integer
  end
end
