class AddProfileFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :role, :integer, default: 0, null: false
  end
end
