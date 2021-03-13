class BarsController < ApplicationController
  before_action :set_bar, only: [:show]

  def show
  end

  private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:name, :address, :description, :budget, :rating, :day, :night, :town, :postcode, :website, :photo)
  end
end
