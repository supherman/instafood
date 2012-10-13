class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  protect_from_forgery

  def find_order
    @order = current_user.last_active_order
  end

end
