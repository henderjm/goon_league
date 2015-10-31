class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  # scope :friends_posts, -> joins(:users).where(:id => {:user => user_id})
  scope :friends_posts_reg, lambda{|user_id| joins(:user).where('user_id = ?', user_id)}

end