class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize
    if !current_user
      flash[:alert] = "Oops only admins can visit that page."
      redirect_to '/'
    end
  end

  def authorize_admin
    if current_user.admin === false
      flash[:alert] = "Only an admin can visit this page."
      redirect_to '/'
    end
  end

end
