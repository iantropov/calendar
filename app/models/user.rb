class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :events, :dependent => :destroy

  validates :email,    :presence => true, :email => true, :uniqueness => true
  validates :password, :presence => true,    :length => { :minimum => 3, :maximum => 30 }
  validates :name,     :allow_blank => true, :length => { :minimum => 3, :maximum => 30 }
end
