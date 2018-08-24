class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
    @user = User.find(session[:user_id])
  end

  def show
    @episode = Episode.find(params[:id])
  end

end
