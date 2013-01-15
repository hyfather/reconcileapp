class RenameExpensesToLineItems < ActiveRecord::Migration
  def change
    rename_table :expenses, :line_items
  end
end
