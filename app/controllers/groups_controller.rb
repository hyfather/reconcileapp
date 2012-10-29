class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @group = Group.new
  end

  def create
    users = params[:group].delete(:users)
    @group = current_user.groups.create(params[:group])

    users = find_or_create_users(users)
    @group.users << users

    head :created
  end

  def show
    @group = current_user.groups.find(params[:id])
  end
  
  private

  def find_or_create_users(emails)
    default_password = "password"

    emails.split(',').map(&:strip).map do |e|
      user = User.find_or_create_by_email(e)
      unless user.persisted?
        user.name = e.split('@').first
        user.password = default_password
        user.save
      end
      user
    end
  end
end
