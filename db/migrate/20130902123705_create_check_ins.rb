class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.belongs_to :locality, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
