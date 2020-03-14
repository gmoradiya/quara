class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :follower_users, :class_name => "Follower", :foreign_key => "following_id"
  has_many :following_users, :class_name => "Follower", :foreign_key => "follower_id"

  has_many :followers, through: :follower_users, class_name: "User", foreign_key: "follower_id"
  has_many :followings, through: :following_users, class_name: "User", foreign_key: "following_id"

  has_many :questions
  has_many :answers
  has_many :topics


  def is_following?(user)
    followings.where(id: user.id).any?
  end
end
