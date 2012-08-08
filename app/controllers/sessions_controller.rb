# This controller handles the name/logout function of the site.  
class SessionsController < ApplicationController
  # render new.rhtml
  def new
    respond_to do |format|
      format.html { render :action => 'new' }
    end
  end

  def create
    user = User.authenticate(params[:name])
    if user
      self.current_user = user
      flash[:notice] = "Logged in successfully"
      redirect_back_or_default(root_path)
    else
      flash[:error] = "Oops! Your name and/or password were not found in our database. Please try again."
      @name       = params[:name]
      render :action => 'new'
    end
  end

  def destroy
    logout!
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(root_path)
  end

end
