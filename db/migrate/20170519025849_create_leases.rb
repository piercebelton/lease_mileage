class CreateLeases < ActiveRecord::Migration[5.0]
  def change
    create_table :leases do |t|
      t.datetime :initial_lease_date
      t.integer :miles_per_year
      t.integer :lease_term

      t.timestamps
    end
  end
end
