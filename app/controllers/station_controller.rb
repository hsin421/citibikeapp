require 'open-uri'
require 'json'
require Rails.root.join("public","data.rb")

class StationController < ApplicationController
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
	#production

	#for all clones please use line 25 instead of line 28
	

	for a in (1..332)

	#development
	#for a in (4..335)	
		dist_list << Station_dist(station, Station.find(a))
		dist_list_id << a
	end
	dist_list_sort = dist_list.sort
    for b in dist_list_sort
        dist_list_sort_id << dist_list_id[dist_list.index(b)]
    end
    if dist_list_sort_id[0]
	  return dist_list_sort_id[0..num]
	else
		return dist_list_sort_id[1..num]
	end
	end

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
	
		@now = Time.now
	end

def about
	@page = 2

end

def data
    near_me_long = params[:nearMeLong]
	near_me_lat = params[:nearMeLat]

    if params[:station_select] != "" 
       @station_select = Station.find(params[:station_select].split("_")[1])
    elsif near_me_long != "" && near_me_lat != ""
    	@station_select = Station.new("latidude"=> near_me_lat.to_f, "logitude" => near_me_long.to_f)
    end

	@stationgroup = []
	cl = Closest(@station_select, 6)
	@bikes = []
	@docks = []
	
		
	bikes = open('http://www.citibikenyc.com/stations/json')
	my_bike = JSON.parse(bikes.read)
	@time = Time.now
	
	
    
	for a in cl
		@stationgroup << Station.find(a)
		@bikes << my_bike["stationBeanList"][Station.find(a).position]["availableBikes"]
		@docks << my_bike["stationBeanList"][Station.find(a).position]["availableDocks"]
	end

	#masterArray = cbdata(Rails.root.join("public","Citybike2014-07-24.csv"))
    #@warn = masterArray[3]


	puts "**********{#{@bikes}, #{@docks}, #{@time}, #{@station_select.id}}*************"

end	

def new

	# @page = 1
	# weather = open('http://api.wunderground.com/api/636181e2c7ad2c65/conditions/q/NY/New_York.json')
	# 	my_weather = JSON.parse(weather.read)
	# 	@icon = my_weather["current_observation"]["icon_url"]
	# 	@w_condition = my_weather["current_observation"]["weather"]
	# 	@temp = my_weather["current_observation"]["temperature_string"]
	# 	@wind = my_weather["current_observation"]["wind_string"]


	weather = open('http://api.wunderground.com/api/636181e2c7ad2c65/conditions/q/NY/New_York.json')
			my_weather = JSON.parse(weather.read)
			@icon = my_weather["current_observation"]["icon_url"]
			@w_condition = my_weather["current_observation"]["weather"]
			@temp = my_weather["current_observation"]["temperature_string"]
			@wind = my_weather["current_observation"]["wind_string"]

	puts "********{ #{request.remote_ip}}***********"
    
end

def find   
      @page = 1

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

	if stationlist != []

	    return stationlist
    else
    	return [Station.new("address" => "No results, please choose a station from the suggested list.")]
    end
end


	    cs1 = params[:cs1]
	    cs2 = params[:cs2]
	    # near_me_long = params[:nearMeLong]
	    # near_me_lat = params[:nearMeLat]
	     @Stations = []
     #    if near_me_lat != "" && near_me_long != ""
     #          fakestation = Station.new("latidude"=> near_me_lat.to_f, "logitude" => near_me_long.to_f)
     #          nearme_stations = Closest(fakestation, 5)
     #          nearme_stations.each do |id|
     #         	@Stations << Station.find(id)
     #         end

	    if cs2 == "" && cs1	
	    	@Stations = find_station(cs_name(cs1), nil)         
	    
	    elsif cs1 == "" && cs2
	    	 int_string = "https://maps.googleapis.com/maps/api/geocode/json?address="+cs2.split(" ").join("+")+",+New+York,+NY&key=AIzaSyChKDkdoRcSL0Xh9FXVgJJyfuGS2QyMkyY"
             intersection = open(int_string)
             my_int = JSON.parse(intersection.read)
             fakestation = Station.new("latidude"=> my_int["results"][0]["geometry"]["location"]["lat"], "logitude" => my_int["results"][0]["geometry"]["location"]["lng"]) 
             int_stations = Closest(fakestation, 5)
             int_stations.each do |id|
             	@Stations << Station.find(id)
             end
	    
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
