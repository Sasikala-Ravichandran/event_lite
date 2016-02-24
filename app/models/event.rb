class Event < ActiveRecord::Base

  validates_presence_of :name, :start_date, :start_time, :venue
  validates :name, length: { minimum: 5, maximum: 50 }
  
  belongs_to :user

  def self.search_events(name)
    where("name LIKE ?", "%#{name}%")
  end
end
