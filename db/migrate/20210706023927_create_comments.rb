class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, foreign_key: true
      t.integer :drawer_id, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
