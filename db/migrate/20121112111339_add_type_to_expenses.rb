class AddTypeToExpenses < ActiveRecord::Migration
  change_table :expenses do |t|
    t.string :type
  end
end
