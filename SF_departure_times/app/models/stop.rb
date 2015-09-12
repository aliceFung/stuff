class Stop < ActiveRecord::Base

  belongs_to  :direction
  delegate  :route, to: :direction

  #==============methods ==================

  #limit distance to .005 difference in lat/lon degree
  #database to stop pinging API for info
  def self.stops_distance(coord)
    lat = coord[0]
    lon = coord[1]
    #not done with this query yet
    Stop.where("latitude - coord[0] AND longitude = ?",coord[0], coord[1])
  end

  def self.nearby_stops(coord)
    list = self.stops_distance(coord)
    list.select("ORDER BY ASC").limit(10)
  end

  #================= add info to db methods ===============

  #get_route_stops for db
  def self.get_all_route_stops
    routes = Route.all
    stop_url_base = "http://webservices.nextbus.com/service/publicXMLFeed?command=routeConfig&a=sf-muni&r="

    routes.each do |route|
      stop_list_url = stop_url_base + route.tag
      response_info = HTTParty.get(stop_list_url)

      self.add_stop_to_Db(response_info["body"]["route"]["stop"], route.id)
    end
  end

  def self.add_stop_to_Db(list, route_id)
    list.each do |stop|
      Stop.create(route_id: route_id,
                       tag: stop["tag"],
                     title: stop["title"],
                  latitude: stop["lat"],
                 longitude: stop["lon"] )
    end
  end

end
