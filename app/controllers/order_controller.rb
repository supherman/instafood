class OrderController < ApplicationController
  before_filter :find_order

  respond_to :json

  def show
    respond_with @order
  end

  def create
    respond_with current_user.orders.create
  end

  def destroy
    respond_with @order.try(:destroy)
  end
end
