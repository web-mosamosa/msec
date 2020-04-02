class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.integer :user_id
      t.string :postcode
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
