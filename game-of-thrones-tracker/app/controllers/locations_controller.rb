class LocationsController < ApplicationController
  def index
    if params[:location]
      region_locations = Location.where(region_id: location_params[:region_id])
      @locations = region_locations
      if region_locations.empty?
        @message = "No locations in this region"
      end
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path
  end

  private
  def location_params
    params.require(:location).permit(:name, :description, :region_id)
  end

end
