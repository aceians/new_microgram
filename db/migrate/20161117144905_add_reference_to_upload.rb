class AddReferenceToUpload < ActiveRecord::Migration[5.0]
  def change
    add_reference :uploads, :user, index: true, foreign_key: true
  end
end
