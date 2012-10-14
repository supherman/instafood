class MenuController < ApplicationController
  skip_before_filter :authenticate_user!

  def show
    @menu_items = MenuItem.all
  end

end
