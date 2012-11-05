class AddCategoriesToExpenses < ActiveRecord::Migration
  change_table :expenses do |t|
    t.string :category
  end
end
