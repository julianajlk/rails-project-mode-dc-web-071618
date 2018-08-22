class RegionsController < ApplicationController
  def index
    if !params[:filter].blank?
      if params[:filter] == "has houses"
        @regions = Region.has_houses
      end
    else
      @regions = Region.all
    end
  end

  def show
    @region = Region.find(params[:id])
  end
end
