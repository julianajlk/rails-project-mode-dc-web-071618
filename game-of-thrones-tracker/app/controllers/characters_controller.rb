class CharactersController < ApplicationController

  def index
    @characters = Character.search(params[:search])
  end

  def show
    @character = Character.find(params[:id])
  end

  private
  def character_params
    params.require(:character).permit(:search)
  end

end
