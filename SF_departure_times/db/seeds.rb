# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# initializing database with route and stop information

Route.destroy_all
Stop.destroy_all

#getting list of routes
Route.get_routes
#getting stop info
Stop.get_all_route_stops








