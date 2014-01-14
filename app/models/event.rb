class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :event_period

  validates :date,            :presence => true, :uniqueness => true
  validates :name,            :presence => true, :length => { :minimum => 3, :maximum => 30 }
  validates :event_period_id, :presence => true

end
