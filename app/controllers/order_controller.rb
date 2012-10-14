class OrderController < ApplicationController
  before_filter :find_order

  respond_to :json

  def show
    @order = current_user.orders.create unless @order
    respond_with @order, include: :shopping_cart_items, methods: [:total, :total_unique_items]
  end

  def create
    respond_with current_user.orders.create
  end

  def destroy
    respond_with @order.try(:destroy)
  end
end
