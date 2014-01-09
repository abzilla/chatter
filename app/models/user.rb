class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :friendships

  has_secure_password

  # this method lets a User object get a list of its related Friendship objects
  # and map those objects to the friend_id's User objects
  def get_friends_list
    friends = self.friendships
    friends = friends.map do |friendship|
      User.find(friendship.friend_id)
    end
  end

end