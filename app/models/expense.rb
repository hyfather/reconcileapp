class Expense < ActiveRecord::Base
  attr_accessible :amount, :description, :merchant

  has_many :transactions
  has_many :users, :through => :transactions

  belongs_to :payer, :class_name => 'User'
  belongs_to :group

  def amount_per_person
    (amount / users.count).round(2) if users.present?
  end
end
