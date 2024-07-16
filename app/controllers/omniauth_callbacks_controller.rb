class OmniauthCallbacksController < ApplicationController
  def twitter
    current_user = User.find_by(id: session[:user_id])
    if current_user.present?

            twitter_account = current_user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
            twitter_account.update(
                name: auth.info.name,
                username: auth.info.nickname,
                image: auth.info.image,
                token: auth.credentials.token,
                secret: auth.credentials.secret,
                )
            redirect_to twitter_accounts_path, notice: "Successfully connected twitter account!"
    else

            TwitterAccount.create(user_id: current_user[:id], username: auth.info.nickname, name: auth.info.name,
                image: auth.info.image,
                token: auth.credentials.token,
                secret: auth.credentials.secret)
            redirect_to twitter_accounts_path, notice: "Successfully connected twitter account!"
    end
    end
end
  def auth
    request.env["omniauth.auth"]
  end
