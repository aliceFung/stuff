class Route < ActiveRecord::Base

  # has_many :directions
  has_many :stops

  #================methods====================

  def self.getRoutes
    route_list_url ='http://webservices.nextbus.com/service/publicXMLFeed?command=routeList&a=sf-muni'

    response_info = HTTParty.get(route_list_url)

  end

end
