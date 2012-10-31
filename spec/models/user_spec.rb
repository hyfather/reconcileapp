require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should have_many(:groups).through(:memberships) }

  it { should have_many(:expenses).through(:transactions) }
  it { should have_many(:payments) }
end
