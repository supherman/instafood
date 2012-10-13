class MenuItemsController < ApplicationController

  before_filter :find_order
  before_filter :find_menu_item, only: [:show, :destroy, :update]

  respond_to :json

  def index
    respond_with @order.try(:shopping_cart_items) || []
  end

  def create
    @menu_item = @order.shopping_cart_items.create(params[:menu_item])
    respond_with @menu_item, location: order_menu_item_path(@menu_item)
  end

  def show
    respond_with @menu_item
  end

  def destroy
    respond_with @menu_item.destroy
  end

  def update
    respond_with @menu_item.update_attributes(params[:menu_item])
  end

  private

  def find_order
    @order = current_user.last_active_order
  end

  def find_menu_item
    @menu_items = @order.shopping_cart_items
    @menu_item = @menu_items.find(params[:id])
  end
end
