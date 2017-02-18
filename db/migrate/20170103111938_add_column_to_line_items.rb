class AddColumnToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :total, :integer
  end
end
