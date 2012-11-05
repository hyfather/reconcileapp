module GroupsHelper
  ALL_USERS_LENGTH = 30

  def list_of_all_users(e)
    e.users.map(&:name).join(', ')
  end

  def title_of_all_users_for_the_expense(e)
    list_of_all_users(e).length > ALL_USERS_LENGTH ? list_of_all_users(e) : ""
  end

  def all_users_for_the_expense(e)
    if e.group.users.count == e.users.count
      "Everyone"
    else
      truncate(list_of_all_users(e), :length => 30)
    end
  end

  def amount_per_person(expense)
    "#{number_to_currency(expense.amount_per_person, :currency =>
                       expense.group.currency_sign)} per person"
  end

  def dashboard_amount_button(group, user)
    [
     "<a ",
     "href='#{group_expenses_path(group)}' ",
     "class='dashboard-amount-button btn #{ group.rolled_up_cumulative_amount(user) > 0 ? 'btn-success' : 'btn-danger' }' ",
     "title='#{user.name}' ",
     "data-content='You owe #{number_to_currency(group.cumulative_amount_owed_by(user), :currency => group.currency_sign)} to others.<br/>Others owe you #{number_to_currency(group.cumulative_amount_owed_to(user), :currency => group.currency_sign)}' ",
     ">",
     "<i class='icon-user icon-white'></i> ",
     number_to_currency(group.rolled_up_cumulative_amount(user).abs, :currency => group.currency_sign),
     "</a>"
    ].join.html_safe
  end
end
