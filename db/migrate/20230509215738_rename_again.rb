class RenameAgain < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password_hash, :Password_digest
  end
end
