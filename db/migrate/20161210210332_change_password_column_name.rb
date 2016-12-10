class ChangePasswordColumnName < ActiveRecord::Migration[5.0]
  def self.up 
    rename_column :users, :password, :password_digest
  end
end
