class AddGroupIdToExpenses < ActiveRecord::Migration
  change_table :expenses do |t|
    t.integer :group_id
  end
end
