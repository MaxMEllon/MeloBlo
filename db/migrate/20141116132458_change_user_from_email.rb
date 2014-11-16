class ChangeUserFromEmail < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :null => false, :unique => false, :default => ""
  end
end
