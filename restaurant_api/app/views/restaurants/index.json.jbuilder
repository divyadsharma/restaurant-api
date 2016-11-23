json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :restaurant_name, :review_count
  json.address do
    json.extract! restaurant, :latitude, :longitude, :city, :state, :zip
  end
  json.rating restaurant.avg_rating
end

