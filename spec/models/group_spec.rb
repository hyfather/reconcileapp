require 'spec_helper'

describe Group do
  it { should have_many(:users).through(:memberships) }
  it { should have_many(:expenses) }
end
