class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def show
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def bar_params
    params.require(:activity).permit(:name, :address, :description, :budget, :rating, :day, :night, :town, :postcode, :website, :photo)
  end
end
