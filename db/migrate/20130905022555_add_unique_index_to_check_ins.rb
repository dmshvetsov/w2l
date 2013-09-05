class AddUniqueIndexToCheckIns < ActiveRecord::Migration
  def change
    add_index :check_ins, [ :locality_id, :user_id ], :unique => true, :name => 'user_locality_tag_index'
  end
end
