class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def index
    @restaurant = Restaurant.where("town ILIKE ?", "%#{params[:query]}%").sample
    @bar = Bar.where("town ILIKE ?", "%#{params[:query]}%").sample
    @activity = Activity.where("town ILIKE ?", "%#{params[:query]}%").sample
  end

  def profile
    @user = current_user
  end
end
