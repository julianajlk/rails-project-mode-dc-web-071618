class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    if @house.characters.empty?
      @message = "There are no characters in this house."
    end
  end
end
