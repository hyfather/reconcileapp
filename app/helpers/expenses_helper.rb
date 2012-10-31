module ExpensesHelper
  def class_for_expense_row(expense, user)
    if expense.payer == user and expense.users.include? user
      "info"
    elsif expense.payer == user and !expense.users.include? user
      "success"
    elsif expense.payer != user and expense.users.include? user
      "error"
    end
  end
end
