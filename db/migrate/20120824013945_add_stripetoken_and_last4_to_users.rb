class AddStripetokenAndLast4ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripetoken, :string
    add_column :users, :last4, :string
  end
end
