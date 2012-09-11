class HomeController < ApplicationController

  skip_before_filter :is_authorized?

  def index
    Chat.new.phat_method
    Chat.new.phat_method
    Message.profess_love
    Message.profess_love
    Message.profess_love
    User.do_stuff
    User.do_stuff
    User.do_stuff
    User.do_stuff

    ::Rails.logger.debug {"logged_in?: #{logged_in?}, current_user: #{current_user}"}
  end
end
