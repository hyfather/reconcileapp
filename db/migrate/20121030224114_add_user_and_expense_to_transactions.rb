class AddUserAndExpenseToTransactions < ActiveRecord::Migration
  change_table :transactions do |t|
    t.belongs_to :user
    t.belongs_to :expense
  end
end
