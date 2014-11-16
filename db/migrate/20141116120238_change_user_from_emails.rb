class ChangeUserFromEmails < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :email, :null => true
    end
  end
end
