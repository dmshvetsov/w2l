class AddUniqueIndexToDislikes < ActiveRecord::Migration
  def change
    add_index :dislikes, [ :tag_id, :user_id ], :unique => true, :name => 'user_dislike_tag_index'
  end
end
