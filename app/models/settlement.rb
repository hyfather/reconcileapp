class Settlement < LineItem
  attr_accessible :amount, :payer, :payee

  has_one :payer, :source => :user

  belongs_to :payee, :class_name => 'User'
  belongs_to :group
end
