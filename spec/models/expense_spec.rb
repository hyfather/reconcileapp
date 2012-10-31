require 'spec_helper'

describe Expense do
  it { should have_many(:users).through(:transactions) }
  it { should belong_to(:payer) }
  it { should belong_to(:group) }
end
