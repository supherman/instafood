class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  protect_from_forgery

  def find_order
    @order = current_user.last_active_order
  end

  def after_sign_in_path_for(resource)
    menu_path
  end

end
