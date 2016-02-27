class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_presence_of :user, :friend
  validates_inclusion_of :verified, in: [true, false]
end
