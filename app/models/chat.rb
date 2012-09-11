class Chat < ActiveRecord::Base
  # attr_accessible :title, :body

  def phat_method
    Rails.logger.debug('Chat#phat_method (instance) called')
  end

  def self.phat_method
    Rails.logger.debug('Chat#phat_method (class) called')
  end

end

