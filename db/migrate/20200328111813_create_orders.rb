class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :pay
      t.string :address
      t.integer :postcode
      t.string :order_name
      t.string :order_status
      t.string :carriage
      t.integer :total_amount

      t.timestamps
    end
  end
end
