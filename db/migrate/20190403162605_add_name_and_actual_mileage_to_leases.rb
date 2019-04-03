class AddNameAndActualMileageToLeases < ActiveRecord::Migration[5.0]
  def change
    add_column :leases, :name, :string
    add_column :leases, :current_mileage, :integer
  end
end
