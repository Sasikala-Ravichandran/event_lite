class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_events, class_name: "Event", foreign_key: "creator_id",
                                                 dependent: :destroy

  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend

  has_many :rev_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :rev_friends, through: :rev_friendships, source: :user

  def self.search_friend(param)
    return User.none if param.blank?

    param.strip!
    param.downcase!
    ((first_name_matches(param)) + (last_name_matches(param)) + (email_matches(param))).uniq
  end

  def self.first_name_matches(param)
    matches('first_name', param)
  end

  def self.last_name_matches(param)
    matches('last_name', param)
  end

  def self.email_matches(param)
    matches('email', param)
  end

  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end

  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

  def attend
    self.attendances.where("accepted = ?", true)
  end

  def invited
    self.attendances.where("accepted = ?", false)
  end

end
