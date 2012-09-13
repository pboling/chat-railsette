class Chat < ActiveRecord::Base
  # attr_accessible :title, :body

  def phat_method(*args)
    "Chat#phat_method (instance) called with #{args.length} args"
  end

  def self.phat_method(*args)
    "Chat#phat_method (class) called with #{args.length} args"
  end

end

