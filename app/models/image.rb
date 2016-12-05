class Image < ApplicationRecord
  belongs_to :upload
  has_attached_file :image, styles: { small: "150x150", :medium => "300x300", large: "700x700" }
  #validates :image, :attachment_content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :image,   presence: true
  validates_attachment_size :image, :less_than => 10.megabytes
end
