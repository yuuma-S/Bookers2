class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	attachment :profile_image

	has_many :books, dependent: :destroy
	has_many :favorites
	has_many :comments

	has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
	has_many :followings, through: :active_relationships, source: :follower

	has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  	has_many :followers, through: :passive_relationships, source: :following

  	def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  	end

	validates :name,    length: { in: 2..20 }
	validates :introduction,    length: { maximum: 50 }
end
