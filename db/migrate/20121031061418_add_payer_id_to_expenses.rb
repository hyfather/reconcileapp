class AddPayerIdToExpenses < ActiveRecord::Migration
  change_table :expenses do |t|
    t.integer :payer_id
  end
end
