class FavouritesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_favourite, only: [:show]
  def index
    @favourites = Favourite.all
  end

  def show; end

  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = Favourite.new(favourite_params)
    if @favourite.save!
      redirect_to favourites_path
    else
      render :new
    end
  end


  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy!
    redirect_to favourites_path
  end

  private

  def set_favourite
    @favourite = Favourite.find(params[:id])
  end
  def favourite_params
    params.require(:favourite).permit(:restaurant_id, :bar_id, :activity_id, :user_id)
  end
end
