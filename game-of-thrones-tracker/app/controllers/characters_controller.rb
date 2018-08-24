class CharactersController < ApplicationController

  def index
    if params[:search]
      search = Character.search(params[:search])
      if search
        @characters = search
      else
        if params[:search] != nil
          @message = "No Region, House, or Character with that name"
        end
        @characters = Character.all
      end
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
