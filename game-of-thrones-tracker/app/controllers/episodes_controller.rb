class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def show
    @episode = Episode.find(params[:id])
  end

end
