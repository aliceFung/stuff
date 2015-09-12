class TransitsController < ApplicationController

  def index
    @routes = Route.all
    #with more time, ajax this options for filtering
    @stops = Stop.all
    @coord, @origin = origin
    # not working yet
    # @transits = Transit.departure_times(@coord)
    @transits = Transit.get_stop_ETD(params[:route], params[:stop_id])
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
    coord, address = Map.locate_user(params[:address], locate_by_ip)
    #address may not be the same as params, if params.blank?
    return coord, address
  end

  #gets location from ip in http request
  def locate_by_ip
    request.location
  end

end
