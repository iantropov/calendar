require 'spec_helper'

describe EventPeriod do
  it { should have_many :events }
end
