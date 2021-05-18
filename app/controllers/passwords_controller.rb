class PasswordsController < ApplicationController
  before_action :require_user_logged!
  def edit

  end

  def update

    if Current.user.update(user_params)
      redirect_to root_path

    else

      render :edit
    end
  end
  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
