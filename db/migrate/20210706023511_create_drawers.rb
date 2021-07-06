class CreateDrawers < ActiveRecord::Migration[5.2]
  def change
    create_table :drawers do |t|
      t.integer :user_id, foreign_key: true
      t.string :name
      t.text :image_id
      t.text :description

      t.timestamps
    end
  end
end
