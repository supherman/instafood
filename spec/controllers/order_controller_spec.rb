require 'spec_helper'

describe OrderController do
  let(:user) do
    stub_model User
  end

  before do
    controller.should_receive(:authenticate_user!)
    controller.stub current_user: user
  end

  describe "GET 'show'" do
    it 'returns http success' do
      get :show, format: :json
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it 'returns http success' do
      post :create, format: :json
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it 'returns http success' do
      delete :destroy, format: :json
      response.should be_success
    end
  end

end
