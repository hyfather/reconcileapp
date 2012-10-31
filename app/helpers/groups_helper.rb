module GroupsHelper
  def title_of_all_users_for_the_expense(expense)
    expense.users.map(&:name).join(', ')
  end

  def all_users_for_the_expense(expense)
    if expense.group.users.count == expense.users.count
      "Everyone"
    else
      truncate(title_of_all_users_for_the_expense(expense), :length => 30)
    end
  end

  def amount_per_person(expense)
    "#{expense.group.currency_sign}#{(expense.amount / expense.users.count).round(2)} per person"
  end
end
