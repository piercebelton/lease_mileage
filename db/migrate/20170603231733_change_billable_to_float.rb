class ChangeBillableToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :wages, :billable, :float
  end
end
