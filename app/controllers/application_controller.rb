class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  private

  def current_user
    Current.user ||= authenticate_user_from_session
  end

  def authenticate_user_from_session
    if session[:user_id] && user = User.find_by(id: session[:user_id])

  def login(user)
    Current.user = user
    reset_session
    session[:user_id] = user.id
  end

  def logout(user)
    Current.user = nil
    reset_session
  end
end
