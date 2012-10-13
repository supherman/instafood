class AuthCheckController < ApplicationController
  respond_to :json

  def show
    respond_with true
  end

end
