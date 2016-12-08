class Upload < ActiveRecord::Base
  belongs_to :user
  has_many :images, :dependent => :destroy
  before_save :destroy_image?
  
  has_many :tags, :dependent => :destroy
  has_many :protections, :dependent => :destroy
  accepts_nested_attributes_for :images , :allow_destroy => true,  :reject_if => lambda { |a| a[:image].blank? } 
  accepts_nested_attributes_for :tags, :allow_destroy => true, :reject_if => lambda { |a| a[:tagname].blank? }
  accepts_nested_attributes_for :protections, :reject_if => lambda { |a| a[:sharedid].blank? }, :allow_destroy => true
  
  PERMISSIONS = ['Public', 'Private', 'Protected']

  default_scope -> { order(created_at: :desc) }
  
  
  def image_delete
    @image_delete ||= "0"
  end

 def image_delete=(value)
   @image_delete = value
 end

private
   def destroy_image?
    self.images.clear if @image_delete == "1"
   end
  
end
