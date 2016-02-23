class Event < ActiveRecord::Base

  validates_presence_of :name, :start_date, :start_time, :venue
  validates :name, length: { minimum: 5, maximum: 50 }
  
end
