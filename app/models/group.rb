class Group < ActiveRecord::Base
  attr_accessible :description, :name, :currency_sign
  
  has_many :memberships
  has_many :users, :through => :memberships

  has_many :expenses
end
