class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.float :amount
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
