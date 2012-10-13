class OrderController < ApplicationController

  respond_to :json

  def show
    respond_with current_user.last_active_order
  end

  def create
    respond_with current_user.orders.create
  end

  def destroy
    respond_with current_user.last_active_order.try(:destroy)
  end
end
