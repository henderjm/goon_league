class Post < ActiveRecord::Base
  has_many :comments

  # scope :friends_posts, lambda{where|user_id| where(user == user_id)}
end
