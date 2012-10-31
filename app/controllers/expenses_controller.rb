class ExpensesController < ApplicationController
  before_filter :authenticate_user!, :find_group
  
  
  def new
    @expense = @group.expenses.new
  end

  def create
    users = users_from_params(params[:expense].delete :users)
    @expense = @group.expenses.create(params[:expense])
    @expense.users << users
    redirect_to group_path(@group)
  end


  private

  def find_group
    @group = current_user.groups.find(params[:group_id])
  end

  def users_from_params(ary)
    ary.map { |id| @group.users.find id }
  end
end
