class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :user_id, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
