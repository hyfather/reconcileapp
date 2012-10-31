class RenameTitleToMerchantInExpense < ActiveRecord::Migration
  change_table :expenses do |t|
    t.rename :title, :merchant
  end
end
