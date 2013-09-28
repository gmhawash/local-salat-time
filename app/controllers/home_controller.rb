class HomeController < ApplicationController
  def index
    @salat = Day.find_by_date(Date.today)
  end
end
