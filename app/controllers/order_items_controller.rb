class OrderItemsController < ApplicationController

  before_filter :find_order
  before_filter :find_order_item, only: [:show, :destroy, :update]

  respond_to :json

  def index
    respond_with @order.try(:shopping_cart_items) || []
  end

  def create
    item = params[:item_type].constantize.find(params[:item_id])
    @order_item = @order.add(item, params[:price], params[:quantity])
    respond_with @order_item, location: order_order_item_url(@order_item)
  end

  def show
    respond_with @order_item
  end

  def destroy
    respond_with @order_item.destroy
  end

  def update
    respond_with @order_item.update_attributes(params[:menu_item])
  end

  private

  def find_order_item
    @order_items = @order.shopping_cart_items
    @order_item = @order_items.find(params[:id])
  end
end
