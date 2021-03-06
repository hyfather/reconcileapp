class Group < ActiveRecord::Base
  attr_accessible :description, :name, :currency_sign
  
  has_many :memberships
  has_many :users, :through => :memberships

  has_many :expenses

  def amount_owed(by, to)
    expenses.select do |e|
      e.payer == to and e.users.include?(by)
    end.map(&:amount_per_person).reduce(:+)
  end

  def rolled_up_amount_owed(opts)
    format_number(amount_owed(opts[:by], opts[:to])) -
      format_number(amount_owed(opts[:to], opts[:by]))
  end
  
  def cumulative_amount_owed_by(u)
    relevant_expenses = expenses.select {|e| e.users.include?(u) and e.payer != u}
    format_number(relevant_expenses.map(&:amount_per_person).reduce(:+))
  end

  def cumulative_amount_owed_to(u)
    relevant_expenses = expenses.select {|e| e.payer == u}
    own_expenses = relevant_expenses.
      select {|e| e.users.include?(u)}.
      map(&:amount_per_person).
      reduce(:+)
    total_expenses = relevant_expenses.map(&:amount).reduce(:+)
    format_number(total_expenses) - format_number(own_expenses)
  end

  def rolled_up_cumulative_amount(u)
    cumulative_amount_owed_to(u) - cumulative_amount_owed_by(u)
  end
  
  private
  def format_number(n)
    n.nil? ? 0 : n.round(2)
  end
end
