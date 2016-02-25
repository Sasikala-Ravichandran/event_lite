class Event < ActiveRecord::Base

  validates_presence_of :name, :start_date, :start_time, :venue, :creator_id
  validates :name, length: { minimum: 5, maximum: 50 }
  
  belongs_to :creator, class_name: "User"

  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances

  def self.search_events(name)
    where("name LIKE ?", "%#{name}%")
  end
end
