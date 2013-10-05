class LocationsController < ApplicationController
  def show
    @location = Location.find_by_nickname(params[:location])
    if @location
      @salat = @location.days.find_by_date(Date.today)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
