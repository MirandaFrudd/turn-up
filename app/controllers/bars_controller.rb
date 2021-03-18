class BarsController < ApplicationController
  before_action :set_bar, only: [:show]

  def show
    @marker =
      [{
        lat: @bar.latitude,
        lng: @bar.longitude,
        # image_url: helpers.asset_url('???.png')
      }]
  end

  private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:name, :address, :description, :budget, :rating, :day, :night, :town, :postcode, :website, :photo)
  end
end
