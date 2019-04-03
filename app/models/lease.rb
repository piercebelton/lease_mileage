class Lease < ApplicationRecord
  belongs_to :user
  validates :initial_lease_date, :miles_per_year, :lease_term, :presence => true
end
