# restaurant model responsible for performing
# various operation ragarding restaurants.
class Restaurant < ActiveRecord::Base
  # include Datafetch
  attr_reader :restaurant_name, :review_count, :latitude,
              :longitutude, :state, :city, :zip,
              :rating
  #called at the time of new object initialization
  def initialize(data)
    @restaurant_name = data['restaurant_name']
    @review_count = data['review_count']
    #doubt for @latitude @longitude
    @address = data['address']
    @rating = data['rating']
  end
  class << self
    def all
      #doubt
      # restaurants = DataFetch::Main.get_restaurants
      # sorted by restaurants review count  order
      ress = "[{\"restaurant_name\":\"Sarvanna Bhavan\",\"review_count\":30,\"address\":{\"latitude\":\"\",\"longitude\":\"\",\"city\":\"\",\"state\":\"\",\"zipcode\":\"\"},\"rating\":\"\"}]" 
      restaurants = JSON.parse(ress)
      debugger
      restaurants.sort_by! { |restaurant| restaurant['review_count'] }
      restaurants.map { |restaurant| new(restaurant) }
    end
  end
end

