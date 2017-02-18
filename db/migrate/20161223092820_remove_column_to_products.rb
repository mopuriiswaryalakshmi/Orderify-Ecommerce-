class RemoveColumnToProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :subcategorie_id
  	add_column :products, :subcategory_id, :integer
  end
end
