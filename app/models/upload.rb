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
  
end
