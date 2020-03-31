class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quoantity
      t.references :item
      t.references :cart
      t.timestamps
    end
  end
end
