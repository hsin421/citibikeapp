require 'open-uri'
require 'json'


class StationController < ApplicationController
  def index
  	    weather = open('http://api.wunderground.com/api/636181e2c7ad2c65/conditions/q/NY/New_York.json')
      	bikes = open('http://www.citibikenyc.com/stations/json')
		my_bike = JSON.parse(bikes.read)
		my_weather = JSON.parse(weather.read)
		@icon = my_weather["current_observation"]["icon_url"]
		@time = my_bike["executionTime"]
		@our_station1 = my_bike["stationBeanList"][253]["availableBikes"]
		@our_station2 = my_bike["stationBeanList"][288]["availableBikes"]
		@our_station3 = my_bike["stationBeanList"][282]["availableBikes"]
		@our_station4 = my_bike["stationBeanList"][289]["availableBikes"]
		@our_station5 = my_bike["stationBeanList"][225]["availableBikes"]
		@our_station6 = my_bike["stationBeanList"][299]["availableBikes"]
		@our_docks1 = my_bike["stationBeanList"][253]["availableDocks"]
		@our_docks2 = my_bike["stationBeanList"][288]["availableDocks"]
		@our_docks3 = my_bike["stationBeanList"][282]["availableDocks"]
		@our_docks4 = my_bike["stationBeanList"][289]["availableDocks"]
		@our_docks5 = my_bike["stationBeanList"][225]["availableDocks"]
		@our_docks6 = my_bike["stationBeanList"][299]["availableDocks"]
		@w_condition = my_weather["current_observation"]["weather"]
		@temp = my_weather["current_observation"]["temperature_string"]
		@wind = my_weather["current_observation"]["wind_string"]

		# @icon = 1
		# @time = 1
		# @our_station1 = 1
		# @our_station2 = 1
		# @our_station3 = 1
		# @our_station4 = 1
		# @our_station5 = 1
		# @our_station6 = 1
		# @our_docks1 = 1
		# @our_docks2 = 1
		# @our_docks3 = 1
		# @our_docks4 = 11
		# @our_docks5 = 1
		# @our_docks6 = 1
		# @w_condition = 1
		# @temp = 1
		# @wind = "asdasdasasdasdadadsadasdasdadasdadsadasdadas"

		
			f = open(Rails.root.join("app","assets","M42east.csv"))
		    a = f.read.split(",")
		    b=[]
		    for i in (0...a.length)
		    	if  Time.now < Time.parse(a[i])
		    		b << a[i]
		    	end
		    end
		    
		@next = ((Time.parse(b[0]) - Time.now)/60).ceil
		@timep = Time.parse(b[0])
		@timenext = Time.parse(b[1])
		@timenn = Time.parse(b[2])
		@now = Time.now
	end

def data
    @station_select = Station.find(params[:station_select].split("_")[1])
	#Note spelling mistake: latidude & logitude
	def Station_dist(station1, station2)
	dist = (((station1.latidude - station2.latidude)*111)**2 + ((station1.logitude-station2.logitude)*84.14)**2)**0.5
    
    return dist
	end
#returns distance in kilometers


#Closest function take a station and a number and returns a number = num of stations closest to station given
	def Closest(station, num)
	dist_list = []
	dist_list_id = []
	dist_list_sort_id = []
	for a in (4..335)
		dist_list << Station_dist(station, Station.find(a))
		dist_list_id << a
	end
	dist_list_sort = dist_list.sort
    for b in dist_list_sort
        dist_list_sort_id << dist_list_id[dist_list.index(b)]
    end
	return dist_list_sort_id[0..num]
	end

	@stationgroup = []
	c = Closest(@station_select, 6)
	@bikes = []
	@docks = []
	bikes = open('http://www.citibikenyc.com/stations/json')
	my_bike = JSON.parse(bikes.read)
	@time = my_bike["executionTime"]
	for a in c
		@stationgroup << Station.find(a)
		@bikes << my_bike["stationBeanList"][Station.find(a).position]["availableBikes"]
		@docks << my_bike["stationBeanList"][Station.find(a).position]["availableDocks"]
	end

	puts "**********{#{@bikes}, #{@docks}, #{@stationgroup}}*************"

end	

def new
    
end

def find   

    
    	def cs_name(string)
            csn = [];
            if string[0] == " "
            	csn << string
            	csn << string[1...string.length]+" "
            else
            	csn << " " + string[0...string.length-1]
            	csn << string 
            end
            return csn
        end

 def find_station(array1, array2)
 stationlist = [];
 if !array2
	if Station.where("cross_st1" => array1[0])
		for a in Station.where("cross_st1" => array1[0])
			stationlist << a
		end
	end
	if Station.where("cross_st1" => array1[1])
		for a in Station.where("cross_st1" => array1[1])
			stationlist << a
		end
	end
	if Station.where("cross_st2" => array1[0])
		for a in Station.where("cross_st2" => array1[0])
			stationlist << a
		end
	end
	if Station.where("cross_st2" => array1[1])
		for a in Station.where("cross_st2" => array1[1])
			stationlist << a
		end
	end
else
	if Station.where("cross_st1" => array1[1], "cross_st2" => array2[0])
		for a in Station.where("cross_st1" => array1[1], "cross_st2" => array2[0])
			stationlist << a
		end
	end
	if Station.where("cross_st1" => array2[1], "cross_st2" => array1[0])
		for a in Station.where("cross_st1" => array2[1], "cross_st2" => array1[0])
			stationlist << a
		end
	end
end

	
	return stationlist
end

	    cs1 = params[:cs1]
	    cs2 = params[:cs2]
	    @Stations = []
	    if cs2 == "" && cs1	
	    	@Stations = find_station(cs_name(cs1), nil)         
	    
	    elsif cs1 == "" && cs2
             @Stations = find_station(cs_name(cs2), nil)
	    
	    elsif cs1 && cs2
	    	  @Stations = find_station(cs_name(cs1), cs_name(cs2))
        end

        # if cs1 && cs2
        # @Stations = find_station(cs_name(cs1), cs_name(cs2))
	    
       # end
        puts "**********{#{cs1}, #{cs2}, #{@Stations}}*************"
        # respond_to do |format|
        # 	format.js
        # end

	end
end
