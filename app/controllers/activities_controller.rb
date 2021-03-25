class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_activity, only: [:show]

  def show
    @marker =
      [{
        lat: @activity.latitude,
        lng: @activity.longitude,
        # image_url: helpers.asset_url('???.png')
      }]
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def bar_params
    params.require(:activity).permit(:name, :address, :description, :budget, :rating, :day, :night, :town, :postcode, :website, :photo)
  end
end
