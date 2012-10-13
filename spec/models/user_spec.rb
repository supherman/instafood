require 'spec_helper'

describe User do
  let(:auth) { { provider: 'twitter', uid: '12345' } }
  let(:user) { mock_model User }

  describe '#self.find_for_twitter_oauth' do
    context 'When a registered user' do
      before do
        User.should_receive(:where).with(provider: auth[:provider], uid: auth[:uid]).and_return [user]
      end

      it 'should return the registered user' do
        User.find_for_twitter_oauth(auth).should eq(user)
      end
    end

    context 'When a no registered user' do
      before do
        User.should_receive(:where).with(provider: auth[:provider], uid: auth[:uid]).and_return []
      end

      it 'should create a new user' do
        User.should_receive(:create).with(provider: auth[:provider], uid: auth[:uid])
        User.find_for_twitter_oauth(auth)
      end
    end
  end
end
