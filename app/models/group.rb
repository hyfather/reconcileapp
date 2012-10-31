class Group < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :memberships
  has_many :users, :through => :memberships

  has_many :expenses
end
