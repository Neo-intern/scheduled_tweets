class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  def new
    render :new
  end

  def create
    @twitter_accounts = request.env["omniauth.auth"]
    if @twitter_accounts = User.authenticate_by(email: params[:email], password: params[:password])
      login @twitter_accounts
      redirect_to root_path, notice: "You have been signed in succesfully."
    else
      flash[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout current_user
    redirect_to root_path, notice: "You have been logged out."
  end
end
