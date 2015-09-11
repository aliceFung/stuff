class TransitsController < ApplicationController

  def index
    @output = Route.getRoutes

    @origin = origin
    @transits = Transit.departure_times(@origin)
    if @transits
      @markers = Map.map_markers(@transits)
    else
      # coord = Map.coordinates(@origin)
      # @markers = Map.no_results(coord[0], coord[1])
    end
  end

  def show
    @origin = origin
    @transits = Transit.departure_times(@origin)
    @markers = Map.map_markers(@transits)
  end

  private

  #sets default address for search
  #calls method to geolocate by ip if no query submitted
  def origin
    Map.locate_user(params[:address], locate_by_ip)
  end

  #gets location from ip in http request
  def locate_by_ip
    request.location
  end

end
