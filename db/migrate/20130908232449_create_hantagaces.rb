class CreateHantagaces < ActiveRecord::Migration
  def change
    create_table :hantagaces do |t|
      t.belongs_to :locality, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
    add_index :hantagaces, [ :locality_id, :tag_id ], unique: true, name: 'hang_tag_on_locality_index'
  end
end
