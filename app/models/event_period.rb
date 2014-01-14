class EventPeriod < ActiveRecord::Base
  has_many :events

  alias_attribute :to_s, :name
end
