class AddMakeStatusToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :make_status, :string
  end
end
