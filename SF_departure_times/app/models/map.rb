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
      marker.lat  location[:latitude]
      marker.lng  location[:longitude]
      marker.infowindow location[:address] + '<br>' +
              'Time left: '+ (location[:etd] - Time.now) +'<br>' +
              'Time: ' + location[:etd]
    end
  end

  def self.no_results(lat, lon)

    #create default location
    location ={ latitutde: lat,
                longitude: lon,
                address: "You were looking here",
                etd: Time.now
              }

    self.map_markers([location])
  end

end
