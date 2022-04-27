class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :country, :string
    add_column :users, :dob, :datetime
    add_column :users, :points, :integer, default: 0
    add_column :users, :tier_type, :string, default: "standard"
  end
end
