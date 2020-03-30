class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :profile_image_id, :string
    add_column :users, :postcode, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :integer
    add_column :users, :user_status, :string
  end
end
