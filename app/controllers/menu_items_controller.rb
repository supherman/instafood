class MenuItemsController < ApplicationController
  before_filter :find_menu_item, only: [:show, :update, :destroy]

  respond_to :json

  def index
    respond_with MenuItem.all
  end

  def show
    respond_with @menu_item
  end

  def create

  end

  def update
    respond_with @menu_item.update_attributes(params[:menu_item])
  end

  def destroy
    respond_with @menu_item.destroy
  end

  private

  def find_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

end
