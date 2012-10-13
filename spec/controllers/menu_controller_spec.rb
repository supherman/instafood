require 'spec_helper'

describe MenuController do
  #let(:user) do
  #  stub_model User
  #end
  #
  #before do
  #  controller.should_receive(:authenticate_user!)
  #  controller.stub current_user: user
  #end

  describe "GET 'show'" do
    it "returns http success" do
      get :show
      response.should be_success
    end
  end

end
