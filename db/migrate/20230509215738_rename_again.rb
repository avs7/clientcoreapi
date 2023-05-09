class RenameAgain < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password_hash, :new_column
  end
end
