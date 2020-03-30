class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :text
      t.string :price
      t.string :image_id
      t.string :make_status
      t.string :sell_status

      t.timestamps
    end
  end
end
