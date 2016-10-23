class ChangeTypeToIndividualRole < ActiveRecord::Migration
  def change
    rename_column :users, :type, :individualrole
  end
end
