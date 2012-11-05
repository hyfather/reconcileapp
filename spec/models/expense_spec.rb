require 'spec_helper'

describe Expense do
  it { should have_many(:users).through(:transactions) }
  it { should belong_to(:payer) }
  it { should belong_to(:group) }

  it "should tell amount per person" do
    bob = User.create(:name => "bob", :email => "bob@bob.com", :password => "password")
    alice = User.create(:name => "alice", :email => "alice@bob.com", :password => "password")

    dinner = Expense.new(:amount => 20.111111)
    dinner.payer = bob
    dinner.users << [bob, alice]
    dinner.save

    dinner.amount_per_person.should == 10.06
  end

  it "should have a category associated with it" do
    Expense.create(:amount => 5, :category => Expense::GROCERIES)
    Expense.groceries.count.should == 1
  end
end
