class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :book

	validates :comment, presence: true
	validates :comment, length: { maximum: 100 }
end
