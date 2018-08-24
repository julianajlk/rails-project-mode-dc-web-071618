class HousesController < ApplicationController
  def index
    if params[:house]
      region_houses = House.where(region_id: house_params[:region_id].to_i)
      @houses = region_houses
    else
      @houses = House.all
    end
  end

  def show
    @house = House.find(params[:id])
    if @house.characters.empty?
      @message = "There are no characters in this house."
    end
  end

  private
  def house_params
    params.require(:house).permit(:region_id)
  end
end
