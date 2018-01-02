class Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user
      else
        session['devise.facebook_data'] = request.env['omniauth.auth']
        redirect_to root_url
      end
    end

    def failure
      redirect_to root_path
    end
  end
end
