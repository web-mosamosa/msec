class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :pay
      t.string :send_address
      t.integer :send_postcade
      t.string :send_name
      t.string :order_status
      t.string :carriage

      t.timestamps
    end
  end
end
