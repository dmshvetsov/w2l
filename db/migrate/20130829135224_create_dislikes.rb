class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
