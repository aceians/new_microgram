class UpdateToUpload < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :imageid, :string
    add_column :uploads, :subid, :string
    add_column :uploads, :url, :string 
    remove_column :uploads, :attachment
    remove_column :uploads, :user_id
  end
end
