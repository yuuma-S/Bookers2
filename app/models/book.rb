class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites
	validates :title, presence: true
	validates :body, presence: true
	validates :body, length: { maximum: 200 }

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

end
