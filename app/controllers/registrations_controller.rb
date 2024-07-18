class RegistrationsController < Devise::RegistrationsController
    def new
        @user = User.new
    end

    def create
      current_user = User.new(sign_up_params)
      if current_user.save
          login current_user
          session[:user_id] = current_user.id
          redirect_to root_path, notice: "Successfully created Account!!!"
      else
          render :new, status: :unprocessable_entity
      end
    end

    private

    def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
    end
end
