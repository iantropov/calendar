class Event < ActiveRecord::Base

  belongs_to :user

  validates :date,    :presence => true, :uniqueness => true
  validates :name,    :presence => true, :length => { :minimum => 3, :maximum => 30 }

end
