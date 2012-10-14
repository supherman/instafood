class MenuItemsController < ApplicationController
  before_filter :find_menu_item, only: [:show, :update, :destroy]

  respond_to :json

  def index
    respond_with MenuItem.includes(:variations), include: :variations
  end

  def show
    respond_with @menu_item, include: :variations
  end

  def create

  end

  def update
    respond_with @menu_item.update_attributes(params[:menu_item]), include: :variations
  end

  def destroy
    respond_with @menu_item.destroy, include: :variations
  end

  private

  def find_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

end
