class Upload < ActiveRecord::Base
  belongs_to :user
  has_many :images, :dependent => :destroy
  has_many :tags, :dependent => :destroy
  has_many :protections, :dependent => :destroy
  accepts_nested_attributes_for :images , :allow_destroy => true,  :reject_if => lambda { |a| a[:image].blank? } 
  accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:tagname].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :protections, :reject_if => lambda { |a| a[:sharedid].blank? }, :allow_destroy => true
  
  PERMISSIONS = ['Public', 'Private', 'Protected']


  
  default_scope -> { order(created_at: :desc) }
  #validates :user_id, presence: true
  #validates :description, presence: true, length: { maximum: 140 }
  
#   has_attached_file :image, :styles => { :medium => "300x300>",:thumb => "100x100>" }
#   validates_attachment 	:image, 
# 				:presence => true,
# 				:content_type => { :content_type => /\Aimage\/.*\Z/ },
# 				:size => { :less_than => 1.megabyte }  
  #has_attached_file :image, styles: { small: "80x80", med: "500x500", large: "700x700" }
  #validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  #has_attached_file :image, styles: { medium: "400x400>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
