json.extract! lease, :id, :initial_lease_date, :miles_per_year, :lease_term, :created_at, :updated_at
json.url lease_url(lease, format: :json)
