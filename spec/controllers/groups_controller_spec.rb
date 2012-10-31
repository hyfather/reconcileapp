require 'spec_helper'

describe GroupsController do
  render_views

  before(:each) do
    @user = User.create(:name => "mango", :email => "mango@mango.com", :password => "password")
    sign_in @user
  end
  
  it "should render new group creation" do
    get :new
    response.should be_success
  end

  it "should create a new group with comma separated email address for members" do
    post :create, {:group => {:name => "apt1314", :description => "sample apt. group", :users => "abc@rec.com, xyz@rec.com"}}

    group = Group.find_by_name("apt1314")
    group.users.count.should == 3
    response.should redirect_to group_path(group)
  end

  it "should show a group" do
    group = Group.create(:name => "apt 1314", :description => "sample group")
    group.users << @user
    
    get :show, :id => group.id

    response.should be_success
    assigns[:group].name.should == "apt 1314"
  end
  
end
