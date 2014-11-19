class DropTagTable < ActiveRecord::Migration
  def change
    drop_table :tag
    drop_table :article_tag
  end
end
