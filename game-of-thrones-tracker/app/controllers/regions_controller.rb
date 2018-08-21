class RegionsController < ApplicationController
  def index
    if !params[:houses].blank?
      if params[:houses] == "has houses"
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
