require 'spec_helper'

describe Order do
  describe '#create_signature' do
    before do
      SecureRandom.should_receive(:base64).and_return 123456
      @order = Order.create
    end

    it 'generates a unique signature when an order is created' do
      @order.signature.should eq(123456)
    end
  end
end
