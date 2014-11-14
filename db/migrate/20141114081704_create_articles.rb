class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :good
      t.integer :blog_id

      t.timestamps
    end
  end
end
