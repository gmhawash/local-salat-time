class Location < ActiveRecord::Base
  has_many :days do
    def current_month(starting_day = nil)
      where(:date => starting_day.beginning_of_month..starting_day.next_month.beginning_of_month).order(:date)
    end
  end

  def to_param
    nickname
  end

  def display_name
    [name, city].join(', ')
  end
end
