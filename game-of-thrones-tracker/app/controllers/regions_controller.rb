class RegionsController < ApplicationController
  def index
    if !params[:filter].blank?
      if params[:filter] == "has houses"
        @regions = Region.has_houses
      elsif params[:filter] == "has locations"
        @regions = Region.has_locations
      end
    else
      @regions = Region.all
    end
  end

  def show
    @region = Region.find(params[:id])
    if @region.houses.empty?
      @message = "There are no houses in this region."
    end
  end
end
