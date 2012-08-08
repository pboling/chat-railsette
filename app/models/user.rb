class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 3 }

  #attr_accessible :name

  def self.authenticate(name)
    User.find_by_name(name)
  end

end
