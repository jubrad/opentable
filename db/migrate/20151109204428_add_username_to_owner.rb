class AddUsernameToOwner < ActiveRecord::Migration
  def change
    add_column :owners, :username, :string
  end
end
