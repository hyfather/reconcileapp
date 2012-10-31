require 'spec_helper'

describe Transaction do
  it { should belong_to(:user) }
  it { should belong_to(:expense) }
end
