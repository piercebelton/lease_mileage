class AddUserIdToWages < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :wages, :users
  end
end


# , column: :user_id, primary_key: "user_id"
