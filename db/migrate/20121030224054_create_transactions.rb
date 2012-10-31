class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|

      t.timestamps
    end
  end
end
