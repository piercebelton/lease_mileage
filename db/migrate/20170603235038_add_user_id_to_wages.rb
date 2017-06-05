class AddUserIdToWages < ActiveRecord::Migration[5.0]
  def change
    add_reference :wages, :users, foreign_key: true
  end
end
