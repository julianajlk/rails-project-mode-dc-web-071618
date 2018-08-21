class CharactersController < ApplicationController

  def index
    search = Character.search(params[:search])
    if search
      @characters = search
    else
      @characters = Character.all
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  private
  def character_params
    params.require(:character).permit(:search)
  end

end
