class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :count
      t.string :price

      t.timestamps
    end
  end
end
