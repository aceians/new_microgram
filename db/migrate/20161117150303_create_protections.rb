class CreateProtections < ActiveRecord::Migration[5.0]
  def change
    create_table :protections do |t|
      t.string :subid
      t.string :sharedid
      t.references :upload, foreign_key: true
      
      t.timestamps
    end
  end
end
