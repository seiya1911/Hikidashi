class AddRowOrderToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :row_order, :integer
  end
end
