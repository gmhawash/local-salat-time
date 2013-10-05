class Location < ActiveRecord::Base
  has_many :days do
    def current_month
      where(:date => Date.today.beginning_of_month..Date.today.next_month.beginning_of_month).order(:date)
    end
  end

  def to_param
    nickname
  end

  def display_name
    [name, city].join(', ')
  end
end
