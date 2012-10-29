class AddGroupsAndUsersToMembership < ActiveRecord::Migration
  change_table :memberships do |t|
    t.belongs_to :user
    t.belongs_to :group
  end
end
