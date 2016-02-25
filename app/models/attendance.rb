class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates_presence_of :user, :event
  validates_inclusion_of :accepted, in: [true, false]
end
