class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 3 }

  #attr_accessible :name
end
