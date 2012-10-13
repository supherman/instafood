class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  end

end
