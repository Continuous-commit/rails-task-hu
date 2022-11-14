# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:github]

  # You should also create an action method in this controller like this:
  def github
    # request.env["omniauth.auth"]にGitHubから送られてきたデータが入っている
    @user = User.find_for_github_oauth(request.env["omniauth.auth"])

    unless @user.persisted?
      session["devise.github_data"] = request.env["omniauth.auth"]
      return redirect_to new_user_registration_url
    end
    
    if @user.profile.blank?
      sign_in @user, event: :authentication
      return redirect_to new_profile_path
    end
    
    sign_in_and_redirect @user, event: :authentication #プロフィールを作成していれば、ログイン
    set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/github
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/github/callback
  # def failure
  #   super
  # end

  protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
