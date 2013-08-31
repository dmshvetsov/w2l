class AddUniqueIndexToLikes < ActiveRecord::Migration
  def change
    add_index :likes, [ :tag_id, :user_id ], :unique => true, :name => 'user_like_tag_index'
  end
end
