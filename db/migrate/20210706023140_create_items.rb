class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id, foreign_key: true
      t.integer :drawer_id, foreign_key: true
      t.string :name
      t.string :image_id
      t.text :description

      t.timestamps
    end
  end
end
