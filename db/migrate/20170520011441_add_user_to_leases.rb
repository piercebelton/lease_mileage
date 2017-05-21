class AddUserToLeases < ActiveRecord::Migration[5.0]
  def change
    add_reference :leases, :user, foreign_key: true
  end
end
