class AddSubcategorieToProducts < ActiveRecord::Migration
  def change
    add_column :products, :subcategorie_id, :integer
  end
end
