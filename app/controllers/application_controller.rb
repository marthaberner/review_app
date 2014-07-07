class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    session[:id].present? && User.find(session[:id])
  end

  def post_belongs_to_user?(post)
    user = User.find(session[:id])
    post.user_id == user.id
  end

  helper_method :logged_in?, :post_belongs_to_user?
end
