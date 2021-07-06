class CreateItemTags < ActiveRecord::Migration[5.2]
  def change
    create_table :item_tags do |t|
      t.integer :item_id, foreign_key: true
      t.integer :tag_id

      t.timestamps
    end
  end
end
