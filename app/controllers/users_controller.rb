class UsersController < ApplicationController

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      flash[:notice] = "There was an error"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    session[:id] = @user.id
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end