class LocationsController < ApplicationController
  def timezone
    'Pacific Time (US & Canada)'
  end

  def show
    @location = Location.find_by_nickname(params[:location])
    @today = today
    if @location
      @salat = @location.days.find_by_date(@today)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def today
    Date.parse(params[:day])
  rescue
    Time.now.in_time_zone(timezone).to_date
  end
end
