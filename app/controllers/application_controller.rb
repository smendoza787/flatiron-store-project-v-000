class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :set_current_cart, :current_cart

  def current_cart
    current_user.current_cart
  end

  def set_current_cart
    current_user.current_cart ||= current_user.carts.create
  end

end
