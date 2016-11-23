class SecondUpdateToUpload < ActiveRecord::Migration[5.0]
  def change
        remove_column :uploads, :imageid
        remove_column :uploads, :subid
  end
end
