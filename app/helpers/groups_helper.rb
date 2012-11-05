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
    "#{expense.group.currency_sign}#{expense.amount_per_person} per person"
  end

  def dashboard_amount_button(group, user)
    [
     "<a ",
     "href='#' ",
     "class='dashboard-amount-button btn #{ group.rolled_up_amount(user) > 0 ? 'btn-success' : 'btn-danger' }' ",
     "title='#{user.name}' ",
     "data-content='You owe #{group.currency_sign}#{group.amount_owed_by(user)}<br/>Others owe you #{group.currency_sign}#{group.amount_owed_to(user)}' ",
     ">",
     "<i class='icon-user icon-white'></i> ",
     group.currency_sign,
     group.rolled_up_amount(user).abs,
     "</a>"
    ].join.html_safe
  end
end
