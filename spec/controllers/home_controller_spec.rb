require 'spec_helper'

describe HomeController do
  it "should redirect to the dashboard if the user is logged in" do
    user = User.create!(:name => 'mango', :email => "mango@mailinator.com", :password => "secret")
    sign_in user

    get :index

    response.should redirect_to "/dashboard"
  end

  it "should NOT redirect to the dashboard if the user is not logged in" do
    get :index
    response.should be_success
  end
end
