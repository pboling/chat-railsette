class HomeController < ApplicationController

  skip_before_filter :is_authorized?

  def index
    ::Rails.logger.debug("logged_in?: #{logged_in?}, current_user: #{current_user}")
  end
end
