class HomeController < ApplicationController

  skip_before_filter :is_authorized?

  def index
    (rand(1) + 1).times do
      args = Array.new(rand(5))
      chat = Chat.new
      chat.save
      chat.phat_method(*args)
      ::Rails.logger.debug("There are #{Chat.count} chat records")
    end
    (rand(1) + 1).times do
      args = Array.new(rand(5))
      Chat.phat_method(*args)
    end
    (rand(1) + 1).times do
      Message.profess_love
    end
    (rand(1) + 1).times do
      User.do_stuff
    end

    ::Rails.logger.debug {"HomeController#index: logged_in?: #{logged_in?}, current_user: #{current_user}"}
  end
end
