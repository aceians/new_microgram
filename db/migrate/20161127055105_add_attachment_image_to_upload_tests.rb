class AddAttachmentImageToUploadTests < ActiveRecord::Migration
  def self.up
    change_table :upload_tests do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :upload_tests, :image
  end
end
