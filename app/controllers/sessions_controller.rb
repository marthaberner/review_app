class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = 'invalid username / password'
      render 'users/index'
    end
  end

  def destroy
    session[:id] = nil
    flash[:notice] = 'You are logged out'
    redirect_to root_path
  end
end