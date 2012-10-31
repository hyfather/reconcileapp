class Expense < ActiveRecord::Base
  attr_accessible :amount, :description, :merchant

  has_many :transactions
  has_many :users, :through => :transactions

  belongs_to :payer, :class_name => 'User'
  belongs_to :group
end
