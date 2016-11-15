class ChangeCreateColumnName < ActiveRecord::Migration[5.0]
  def change
      rename_column :uploads, :decription, :description
  end
end
