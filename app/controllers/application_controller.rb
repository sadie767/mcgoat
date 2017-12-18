class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end

  def authorize_admin
    if current_user.admin === true
      new_product_path
    else
      flash[:alert] = "Only an admin can visit this page."
      redirect_to '/'
    end
  end

end
