class RegisterController < ApplicationController
  def create
    @user=User.new
  end

  def created
     @user=User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      puts("wrong")
      render plain:params[:user]
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
