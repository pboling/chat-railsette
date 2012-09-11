class Message < ActiveRecord::Base
  #attr_accessible :body, :from_id, :to_id, :chat_id
  def self.profess_love
    "I Love You!"
  end

end
