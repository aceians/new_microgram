class Image < ApplicationRecord
  belongs_to :upload
  has_attached_file :image, styles: { small: "150x150", :medium => "300x300", large: "700x700" }
                    # :storage => :s3,
                    # :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates :image, :attachment_content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes

  # def s3_credentials
  #   {:bucket => "testmicrogram", :access_key_id => "AKIAJAWXAPORPHDP3THA", :s3_region => "us-west-2",
  #   :secret_access_key => "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"}
  # end
end
