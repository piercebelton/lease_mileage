class RemoveUsersIdFromWagesAddUserId < ActiveRecord::Migration[5.0]
  def change
    remove_column :wages, :users_id
    add_reference :wages, :user, foreign_key: true
  end
end
