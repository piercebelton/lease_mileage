class Lease < ApplicationRecord
  belongs_to :user
  validates :name, :initial_lease_date, :miles_per_year, :lease_term, :current_mileage, :presence => true
  validates :miles_per_year, :lease_term, :current_mileage, numericality: { only_integer: true }
  validate :int_fields_not_zero

  def projected_mileage
     (days_into_lease / (lease_term / 12.0 * 365.0) * total_allotted_miles).to_i
  end

  def days_into_lease
    days = (Date.today - initial_lease_date).to_f
    days = 1.0 if days == 0.0
    days
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

  def int_fields_not_zero
     if miles_per_year == 0
       errors.add(:miles_per_year, "Must not be 0")
     elsif lease_term == 0
       errors.add(:lease_term, "Must not be 0")
     elsif current_mileage == 0
       errors.add(:current_mileage, "Must not be 0")
     end
  end

end
