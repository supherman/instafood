Before('@omniauth') do
  OmniAuth.config.test_mode = true

  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:twitter] = {
      uid:        '123456',
      provider:   'twitter',
      info: {
          name:     'Foo',
          nickname: 'bar'
      }
  }
end

After('@omniauth') do
  OmniAuth.config.test_mode = false
end
