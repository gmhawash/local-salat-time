class LocationsController < ApplicationController
  def show
    @location = Location.find_by_nickname(params[:location])
    @salat = @location.days.find_by_date(Date.today)
  end
end
