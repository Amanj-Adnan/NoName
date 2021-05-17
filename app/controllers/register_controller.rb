class RegisterController < ApplicationController
  def create
    @user=User.new
  end

  def created
     @user=User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else

      render :create
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
