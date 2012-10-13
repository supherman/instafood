class OrderController < ApplicationController

  respond_to :json

  def show
    respond_with current_user.orders.last_active
  end

  def create
    respond_with current_user.orders.create
  end

  def destroy
    respond_with current_user.orders.last_active.try(:destroy)
  end
end
