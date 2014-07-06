class UsersController < ApplicationController

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render 'registrations/new'
    end
  end

  def show
    @posts = Post.all
    @user = User.find(params[:id])
    session[:id] = @user.id
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

