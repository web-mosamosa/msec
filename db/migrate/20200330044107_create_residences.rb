class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :user_id
      
      t.timestamps
    end
  end
end
