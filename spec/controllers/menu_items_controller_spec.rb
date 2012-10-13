require 'spec_helper'

describe MenuItemsController do
  let(:order) { stub_model Order }
  let(:user) do
    stub_model User, last_active_order: order
  end

  let(:menu_item) { stub_model MenuItem, destroy: true }
  let(:menu_items) { mock(find: menu_item, create: menu_item) }

  before do
    controller.should_receive(:authenticate_user!)
    controller.stub current_user: user
  end

  describe "GET 'index'" do
    it 'returns http success' do
      get :index, format: :json
      response.should be_success
    end
  end

  describe "GET 'create'" do
    before do
      order.stub shopping_cart_items: menu_items
    end

    it 'returns http success' do
      post :create, format: :json
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before do
      order.stub shopping_cart_items: menu_items
    end

    it 'returns http success' do
      get :show, id: 1, format: :json
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    before do
      order.stub shopping_cart_items: menu_items
    end

    it 'returns http success' do
      delete :destroy, id: 1, format: :json
      response.should be_success
    end
  end

  describe "GET 'update'" do
    before do
      order.stub shopping_cart_items: menu_items
    end

    it 'returns http success' do
      put :update, id: 1, format: :json
      response.should be_success
    end
  end

end
