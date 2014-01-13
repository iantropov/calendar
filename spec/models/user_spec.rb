require 'spec_helper'

describe User do

  it { should have_many(:events).dependent(:destroy)   }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should ensure_length_of(:password).is_at_least(3).is_at_most(30) }
  it { should ensure_length_of(:name).is_at_least(3).is_at_most(30) }

end
