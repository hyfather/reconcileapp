class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => 'dashboard'

  def index
    redirect_to dashboard_path if current_user
  end
end
