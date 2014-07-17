require 'open-uri'
require 'json'
require 'time'

bikes = open('http://www.citibikenyc.com/stations/json')
my_bike = JSON.parse(bikes.read)

for a in (0...my_bike["stationBeanList"].length)
	Station.create("position"=>a, "dock_id"=>my_bike["stationBeanList"][a]["id"], "total_docks"=>my_bike["stationBeanList"][a]["totalDocks"], "address"=>my_bike["stationBeanList"][a]["stAddress1"], "latidude"=>my_bike["stationBeanList"][a]["latitude"], "logitude"=>my_bike["stationBeanList"][a]["longitude"])
end
