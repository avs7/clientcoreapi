class RenamePass < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :new_column, :password_digest
  end
end
