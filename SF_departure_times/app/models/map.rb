class Map

  def self.locate_user(address, user_ip)
    if address.blank?
      address = Map.address_from_ip(user_ip)
      address ||= 'San Francisco'
    end
    return address
  end

  def self.address_from_ip(user_ip)
    if user_ip && user_ip.address != "Reserved"
        return user_ip.address
    end
  end


  #yields coordinates in format [42.700149, -74.922767]
  def self.coordinates(address_str)
    Geocoder.coordinates(address_str)
  end


  # generate map markers for departure locations nearby

  def self.map_markers(locations)
    Gmaps4rails.build_markers(locations) do |location, marker|
      marker.lat  location[:lat]
      marker.lng  location[:lon]
      marker.infowindow location[:address] + '<br>' +
              'ETD: ' + location[:etd]+ ' minutes'
    end
  end

  def self.no_results(lat, lon)

    #create default location
    location ={ lat: lat,
                lon: lon,
                address: "You are here",
                etd: Time.now
              }

    self.map_markers([location])
  end

end
