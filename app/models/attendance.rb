class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates_presence_of :user, :event
  validates_inclusion_of :accepted, in: [true, false]

  def self.already_accepted_and_attending(user_id, event_id)
    where("user_id = ? AND event_id = ?", user_id, event_id).where("accepted = ?", true).exists?
  end

  def self.invited_but_not_accepted(user_id, event_id)
    where("user_id = ? AND event_id = ?", user_id, event_id).where("accepted = ?", false).exists?
  end

  def self.not_yet_invited(user_id, event_id)
    !where("user_id = ? AND event_id = ?", user_id, event_id).exists?
  end

  def self.find_by_user_event(user_id, event_id)
    where("user_id = ? AND event_id = ?", user_id, event_id).first
  end
end
