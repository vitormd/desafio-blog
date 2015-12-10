class Post < ActiveRecord::Base
	extend FriendlyId
	validates :title, presence: true, length: {minimum: 1, maximum: 255}
	validates :message, presence: true

	friendly_id :title, use: [:slugged, :finders]
end
