class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :country, :string
    add_column :users, :dob, :string
    add_column :users, :points, :integer, default: 0
  end
end
