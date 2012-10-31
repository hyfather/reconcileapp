require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should have_many(:groups).through(:memberships) }

  it { should have_many(:expenses).through(:transactions) }
  it { should have_many(:payments) }

  it "should tell how much money the user owes to everyone across reconile app" do
    bob = User.create(:name => "bob", :email => "bob@bob.com", :password => "password")
    alice = User.create(:name => "alice", :email => "alice@bob.com", :password => "password")
    panda = User.create(:name => "panda", :email => "panda@bob.com", :password => "password")

    group1 = Group.create(:name => "first")
    group1.users << [bob, alice]

    group2 = Group.create(:name => "second")
    group2.users << [panda, alice]

    dinner = group1.expenses.create(:amount => 10)
    dinner.payer = bob
    dinner.users << [bob, alice]
    dinner.save
 
    lunch = group2.expenses.create(:amount => 20)
    lunch.payer = panda
    lunch.users << [panda, alice]
    lunch.save

    alice.owes_total.should == 15
  end
end
