# restaurantcontroller responsible of manarender json: @messagesging restaurants
class RestaurantsController < ApplicationController
  def index
    # listing all restaurants
    @restaurants = Restaurant.data
  end
end
