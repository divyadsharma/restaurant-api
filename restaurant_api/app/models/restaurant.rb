require 'data_fetch/main.rb'
# restaurant model responsible for performing
# various operation ragarding restaurants.
class Restaurant
  include DataFetch
  attr_reader :restaurant_name, :review_count, :latitude,
              :longitude, :state, :city, :zip,
              :avg_rating
  # called at the time of new object initialization
  def initialize(data)
    @restaurant_name = data['name']
    @review_count = data['review_count']
    @latitude = data['latitude']
    @longitude = data['longitude']
    @city = data['city']
    @state = data['state']
    @zip = data['zip']
    @avg_rating = data['avg_rating']
  end
  
  class << self
    def data
      # fetching restaurants data
      restaurants = DataFetch::Main.fetch_restaurants['businesses']
      # sorted by restaurants review count
      restaurants.sort_by! { |restaurant| restaurant['review_count'] }
      # creating new instance of restaurant class
      restaurants.map { |restaurant| new(restaurant) }
    end
  end
end
