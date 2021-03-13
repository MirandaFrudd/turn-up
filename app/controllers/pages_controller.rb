class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def index
    @restaurant = Restaurant.where("town ILIKE ?", "%#{params[:query]}%").sample
    @bar = Bar.where("town ILIKE ?", "%#{params[:query]}%").sample
    @activity = Activity.where("town ILIKE ?", "%#{params[:query]}%").sample
  end

  def index_restaurant
    @restaurant = Restaurant.all.sample
    respond_to do |format|
      format.html
      format.json { render json: { restaurant: @restaurant } }
    end
  end

  def index_bar
    @bar = Bar.all.sample
    respond_to do |format|
      format.html
      format.json { render json: { bar: @bar } }
    end
  end

  def index_activity
    @activity = Activity.all.sample
    respond_to do |format|
      format.html
      format.json { render json: { activity: @activity } }
    end
  end

  def profile
    @user = current_user
  end
end
