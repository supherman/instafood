class PaymentsController < ApplicationController

  before_filter :find_order

  respond_to :json

  def create
    @order.process_payment(params[:payment])
    respond_with @order, location: order_url
  end

end
