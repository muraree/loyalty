class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :user, foreign_key: true
      t.integer :amount
      t.boolean :foreign_country, default: false

      t.timestamps
    end
  end
end
