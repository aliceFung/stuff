class DeparturesController < ApplicationController

  def index
    @departures = Transit.departure_times(origin)
    if @departures
      @hash = Map.map_markers(@departures)
    else
      coord = Map.coordinates(address_for_query)
      @hash = Map.no_results(coord[0], coord[1])
    end
  end

  def show
    @departures = Transit.departure_times(origin)
    @hash = Map.map_markers(@departures)
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
