require 'spec_helper'

describe PaymentsController do
  let(:user) do
    stub_model User
  end

  let(:order) { stub_model Order }

  before do
    controller.should_receive(:authenticate_user!)
    controller.stub current_user: user
  end

  describe "POST 'create'" do
    before do
      user.stub last_active_order: order
      order.should_receive :process_payment
    end

    it 'returns http success' do
      post :create, format: :json
      response.should be_success
    end
  end

end
