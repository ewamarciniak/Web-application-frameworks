class ApplicationController < ActionController::Base
  protect_from_forgery

  def ensure_admin
    unless current_user && current_user.admin?
      if current_user
        go_back
      else
        redirect_to new_user_session_url, :alert => "You are not authorized to access the requested page"
      end
    end
  end

  def go_back
    #make an attempt to redirect back
    redirect_to :back, :alert => "You are not authorized to access the requested page"
  #catch the exception if HTTP referer is not set and redirect to weight log page
  rescue ActionController::RedirectBackError
    redirect_to weight_logs_path, :alert => "You are not authorized to access the requested page"
  end
end
