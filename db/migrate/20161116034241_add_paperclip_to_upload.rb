class AddPaperclipToUpload < ActiveRecord::Migration[5.0]
  def change
    add_attachment :uploads, :image 
  end
end
