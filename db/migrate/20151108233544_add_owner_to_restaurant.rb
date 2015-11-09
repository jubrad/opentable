class AddOwnerToRestaurant < ActiveRecord::Migration
  def change
    add_reference :restaurants, :owner, index: true, foreign_key: true
  end
end
