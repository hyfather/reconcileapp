class Expense < LineItem
  attr_accessible :amount, :description, :merchant, :category

  has_many :transactions
  has_many :users, :through => :transactions

  belongs_to :payer, :class_name => 'User'
  belongs_to :group

  CATEGORIES = ['groceries',
                'equipment',
                'monthly',
                'dining',
                'other'
               ].map(&:upcase)
  CATEGORIES.each do |c|
    const_set c, c 
    scope c.downcase.to_sym, where(:category => "#{self.to_s}::#{c}".constantize)
  end

  def category
    "#{self.class.to_s}::#{self[:category]}".constantize
  end
  
  def amount_per_person
    (amount / users.count).round(2) if users.present?
  end
end
