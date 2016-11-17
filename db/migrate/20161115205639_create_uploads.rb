class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.text :decription
      t.references :user, foreign_key: true
      t.string :attachment
      t.string :permission
      
      t.timestamps
    end
    add_index :uploads, [:user_id, :created_at]
  end
end
