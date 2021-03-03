class FavouritesController < ApplicationController

  def index
    @favourites = Favourite.all
  end

  def create
  end
end
