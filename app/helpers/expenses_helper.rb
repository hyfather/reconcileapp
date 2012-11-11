module ExpensesHelper
  def class_for_expense_row(expense, user)
    if expense.payer == user
      "success"
    else
      "error"
    end
  end

  def symbol_for_category(e)
    {
      Expense::GROCERIES => '<i class="icon-shopping-cart"></i>',
      Expense::EQUIPMENT => '<i class="icon-tags"></i>',
      Expense::MONTHLY => '<i class="icon-repeat"></i>',
      Expense::DINING => '<i class="icon-glass"></i>',
      Expense::OTHER => '<i class="icon-asterisk"></i>',
    }[e.category].html_safe
  end

  def title_for_category(e)
    {
      Expense::GROCERIES => 'Groceries',
      Expense::EQUIPMENT => 'Equipment',
      Expense::MONTHLY => 'Monthly Recurring',
      Expense::DINING => 'Entertainment and Dining',
      Expense::OTHER => 'Miscellaneous',
    }[e.category]
  end

end
