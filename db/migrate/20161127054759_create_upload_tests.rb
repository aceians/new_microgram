class CreateUploadTests < ActiveRecord::Migration[5.0]
  def change
    create_table :upload_tests do |t|

      t.timestamps
    end
  end
end
