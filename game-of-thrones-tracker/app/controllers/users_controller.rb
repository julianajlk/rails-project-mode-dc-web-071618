class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def edit_episode
    @user = User.find_by(id: session[:user_id])
    render :user_episode_form
  end

  def update_episode
    @user = User.find_by(id: session[:user_id])
    @user.update(user_params)
    if @user.valid?
      @user.save
      redirect_to user_characters_path
    else
      render :user_episode_form
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :episode_id)
    end

end
