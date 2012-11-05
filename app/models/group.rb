class Group < ActiveRecord::Base
  attr_accessible :description, :name, :currency_sign
  
  has_many :memberships
  has_many :users, :through => :memberships

  has_many :expenses

  def amount_owed_by(u)
    relevant_expenses = expenses.select {|e| e.users.include?(u) and e.payer != u}
    relevant_expenses.map(&:amount_per_person).reduce(:+).round(2)
  end

  def amount_owed_to(u)
    relevant_expenses = expenses.select {|e| e.payer == u}
    own_expenses = relevant_expenses.map(&:amount_per_person).reduce(:+).round(2)
    total_expenses = relevant_expenses.map(&:amount).reduce(:+).round(2)
    total_expenses - own_expenses
  end
end
