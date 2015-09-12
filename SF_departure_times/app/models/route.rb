class Route < ActiveRecord::Base

  has_many :stops

  #================methods====================




  #================= add info to db methods ===============
  def self.get_routes
    route_list_url ='http://webservices.nextbus.com/service/publicXMLFeed?command=routeList&a=sf-muni'

    response_info = HTTParty.get(route_list_url)
    self.add_routes_to_Db(response_info["body"]["route"])
  end

  def self.add_routes_to_Db(list)
    list.each do |route|
      Route.create(tag: route["tag"], title: route["title"])
    end
  end

end
