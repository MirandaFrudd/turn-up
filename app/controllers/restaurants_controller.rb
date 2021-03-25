class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_restaurant, only: [:show]

  def show
    @marker =
      [{
        lat: @restaurant.latitude,
        lng: @restaurant.longitude,
        image_url: helpers.asset_url('logo_small_icon_only.png')
      }]
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :budget, :rating, :day, :night, :town, :postcode, :website, :photo)
  end
end
