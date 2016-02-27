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
