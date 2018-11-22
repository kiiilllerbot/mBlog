class Post < ApplicationRecord
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	def should_generate_new_friendly_id?
  		title_changed?
  	end

	has_many :comments, dependent: :destroy
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
