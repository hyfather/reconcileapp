class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :name
  validates_presence_of :email, :name

  has_many :memberships
  has_many :groups, :through => :memberships

  has_many :transactions
  has_many :expenses, :through => :transactions

  has_many :payments, :class_name => "Expense", :foreign_key => 'payer_id'

  def owes_total
    expenses.map(&:amount_per_person).reduce(&:+)
  end
end
