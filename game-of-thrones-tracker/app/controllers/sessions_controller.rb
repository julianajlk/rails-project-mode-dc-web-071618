class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_characters_path
    else
      flash.notice = "Username and Password are incorrect"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end

end
