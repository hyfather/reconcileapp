class AddCurrencySignToGroup < ActiveRecord::Migration
  change_table :groups do |t|
    t.string :currency_sign
  end
end
