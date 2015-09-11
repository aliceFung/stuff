== README

Uber coding challenge
option 1: departure times

Create a service that gives real-time departure time for public transportation (use freely available public API). The app should geolocalize the user.



basic requirements:
-geolocalize user
-API to get public transportation times
  -specify where on map

other things:
- cookie?

outline:
View
- geolocalize user on map
- display public transportation times as little bubbles
- refreshes information every minute
- lists most recent departure time first
- ajax request to refresh list changing

Controller
- index view- geolocate, and departure times
- show view - what was requested

Model
- not really needed because not storing anything


