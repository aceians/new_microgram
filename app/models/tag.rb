class Tag < ApplicationRecord
     belongs_to :upload
     
def self.search(search)
  where("tagname LIKE ?", "%#{search}%") 
end
end
