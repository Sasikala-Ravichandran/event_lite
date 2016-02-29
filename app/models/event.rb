class Event < ActiveRecord::Base

  validates_presence_of :name, :start_date, :start_time, :venue, :creator_id
  validates :name, length: { minimum: 5, maximum: 50 }
  
  belongs_to :creator, class_name: "User"

  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances

  scope :oncoming, -> { where('start_date >=?', Date.today) }
  scope :past, -> { where('start_date < ?', Date.today) }


  def self.search_events(param)
    param.strip!
    param.downcase!
    where("name LIKE ?", "%#{param}%")
  end

  def upcoming
    start_date >= Date.today ? true : false
  end
  
  def attending_events
    self.attendances.where("accepted = ?", true)
  end

  def inviting_events
    self.attendances.where("accepted = ?", false)
  end
end
