class Blog < ApplicationRecord
	has_rich_text :content
	belongs_to :user
	enum :post, [:draft ,:published]
	scope :published_online, -> {where(post: 1)}
end
