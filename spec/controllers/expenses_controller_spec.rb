require 'spec_helper'

describe ExpensesController do
  render_views
  
  before(:each) do
    @user = User.create(:name => "mango", :email => "mango@mango.com", :password => "password")
    sign_in @user
  end

  it "should instantiate new expenses in the context of a group" do
    group = Group.create(:name => "apt1314")
    group.users << @user
    
    get :new, :group_id => group.id
    assigns[:expense].group.id.should == group.id
  end

  it "should create a new expense from the submitted form including the multiselected users" do
    group = Group.create(:name => "apt1314")
    other_user = User.create(:name => "banana", :email => "banana@mango.com", :password => "password")
    group.users << [@user, other_user]
    
    post :create, :group_id => group.id, "expense" => {"amount"=>"5", "merchant"=>"Safeway", "description"=>"pizza tortilla tomatoes", "users"=>[@user.id, other_user.id], "category" => "GROCERIES"}

    assigns[:expense].payer.id.should == @user.id
    assigns[:expense].users.map(&:id).sort.should == [@user.id, other_user.id].sort
    Expense.groceries.reload.count.should == 1
    response.should redirect_to group_path(group)
  end

  it "should show how expenses with respect to the currently signed in user" do
    group = Group.create(:name => "apt1314", :currency_sign => "$")
    group.users << [@user]
    expense = group.expenses.create(:merchant => "Safeway", :amount => 5)
    expense.payer = @user; expense.save
    group.expenses.create(:merchant => "Target", :amount => 10)

    get :index, :group_id => group.id
    
    assigns[:expenses].length.should == 1
  end
  
end
