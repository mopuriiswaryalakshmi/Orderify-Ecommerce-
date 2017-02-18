class CreateWhishLists < ActiveRecord::Migration
  def change
    create_table :whish_lists do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
