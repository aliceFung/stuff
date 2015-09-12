class Transit


  def departure_times(coord)
    #find stops near coord
    Stop.nearby_stops(coord)
  end

  def self.get_stop_ETD(route = "N", stop_tag ="5195")
    route ||= "N"
    stop_tag ||= "5195"
    url = "http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=sf-muni&r="
    url += route
    url += "&s=" + stop_tag

    response_info = HTTParty.get(url)
    info = response_info["body"]["predictions"]
    #two directions need to be taken care of
    self.prep_marker_info(info["direction"]["prediction"], stop_tag)
  end

  def self.get_ETD(list)
    base_url = "http://webservices.nextbus.com/service/publicXMLFeed?command=predictionsForMultiStops&a=sf-muni"
    list.each do |stop|
      base_url+= "&stops=<" + stop.routes.tag + "|" +stop.tag
    end

    response_info = HTTParty.get(base_url)
    self.prep_marker_info(response_info["body"]["predictions"]["direction"])
  end

  def self.prep_marker_info(predictions, stop_id)
    #needs to edit into model method to avoid SQL injection
    stop = Stop.find_by_tag(stop_id)
    list = []
    predictions.each do |prediction|
      location ={ lat: stop.latitude,
                  lon: stop.longitude,
                  address: stop.title,
                  etd: prediction["minutes"]
                }
      list << location
    end
    return list
  end

end
