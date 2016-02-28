class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_presence_of :user, :friend
  validates_inclusion_of :verified, in: [true, false]

  def self.not_yet_friends(user_id, friend_id)
    !(where("user_id = ? AND friend_id = ?", user_id, friend_id).exists? ||
    where("user_id = ? AND friend_id = ?", friend_id, user_id).exists?)
  end

  def self.requested_but_not_accepted(user_id, friend_id)
    where("user_id = ? AND friend_id = ?", friend_id, user_id).where("verified = ?", false).exists?
  end

  def self.already_friends(user_id, friend_id)
    (where("user_id = ? AND friend_id = ? ",user_id, friend_id).exists? ||
      where("user_id = ? AND friend_id = ? ",friend_id, user_id).exists?)
  end

  def self.find_by_user_friend(user_id, friend_id)
    where("user_id = ? AND friend_id = ?", friend_id, user_id).first
  end

end
