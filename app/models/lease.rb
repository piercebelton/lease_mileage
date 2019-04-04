class Lease < ApplicationRecord
  belongs_to :user
  validates :initial_lease_date, :miles_per_year, :lease_term, :presence => true

  def projected_mileage
     (days_into_lease / (lease_term / 12.0 * 365.0) * total_allotted_miles).to_i
  end

  def days_into_lease
    (Date.today - initial_lease_date).to_f
  end

  def total_allotted_miles
    miles_per_year * (lease_term / 12)
  end

  def miles_remaining
    total_allotted_miles - current_mileage
  end

  def miles_left_per_day
    (miles_remaining / days_remaining).to_i
  end

  def miles_left_per_week
    miles_left_per_day * 7
  end

  def miles_left_per_month
    miles_left_per_day * 30
  end

  def days_remaining
    (initial_lease_date + lease_term.months - Date.today).to_f
  end

  def on_track?
    (miles_remaining / days_remaining) >= (current_mileage / days_into_lease)
  end

  def projected_miles_over
    ((current_mileage / days_into_lease) * (lease_term / 12.0 * 365.0) - total_allotted_miles).to_i
  end

  def estimated_overage_cost
    overage = projected_miles_over.to_f
    low = (overage * 0.15).to_i
    high = (overage * 0.3).to_i
    "$#{low} and $#{high}"
  end

end
