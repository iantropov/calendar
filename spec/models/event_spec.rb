require 'spec_helper'

describe Event do

  it { should belong_to :user }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:date) }

  it { should ensure_length_of(:name).is_at_least(3).is_at_most(30) }

end
