class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @menu_items = MenuItem.all.sample(4)
  end

end
