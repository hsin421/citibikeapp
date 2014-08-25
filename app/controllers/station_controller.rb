require 'open-uri'
require 'json'

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

def about

end

def data
    @station_select = Station.find(params[:station_select].split("_")[1])
	
	@stationgroup = []
	c = Closest(@station_select, 6)
	@bikes = []
	@docks = []
	
		
	bikes = open('http://www.citibikenyc.com/stations/json')
	my_bike = JSON.parse(bikes.read)
	@time = my_bike["executionTime"]
	@exeT = Time.now
	
    
	for a in c
		@stationgroup << Station.find(a)
		@bikes << my_bike["stationBeanList"][Station.find(a).position]["availableBikes"]
		@docks << my_bike["stationBeanList"][Station.find(a).position]["availableDocks"]
	end

	puts "**********{#{@bikes}, #{@docks}}*************"

end	

def new

	puts "********{ #{request.remote_ip}}***********"
    
end

def find   

allcross = ["Franklin St ", "W 17 St ", "Park Ave ", "Barrow St ", "Nassau St ", "Hudson St ", " Reade St", " Warren St", "E 40 St ", " Atlantic Ave", "E 37 St ", "LaGuardia Pl ", " W 3 St", "W 18 St ", " W 49 St", "W 16 St ", "Columbia Heights ", " Cranberry St", "Old Fulton St", "Spruce St ", "W 14 St ", " The High Line", "E 48 St ", "Great Jones St", "Joralemon St ", " Adams St", "Willoughby St ", " Fleet St", "Flushing Ave ", " Carlton Ave", " Rockwell Pl", " Hall St", "Perry St ", "Laight St ", "Harrison St ", " Jersey St", "MacDougal St ", "W 11 St ", "Lispenard St ", " Whitehall St", "Broad St ", "Johnson St ", "Washington Park", "Maiden Ln ", " Pearl St", " W 36 St", "Adelphi St ", "Ashland Pl ", " Fort Greene Pl", "Duane St ", "Kent Ave ", " S 11 St", " Montgomery St", "Washington Square E", " E Broadway", "Division St ", " Bowery", "E 15 St ", "Shevchenko Pl ", " E 3 St", "E 58 St ", "Cliff St ", "Canal St ", " Rutgers St", "St James Pl ", " Oliver St", "State St ", " Smith St", "Norfolk St ", " E Houston St", "Cadman Plaza West ", "South St ", " Gouverneur Ln", "Park Pl ", "Leonard St ", " Red Cross Pl", "Lawrence St ", " Hudson Ave", "E 19 St ", "Watts St ", "Greenwich St ", " N Moore St", "Reade St ", "Pike St ", "Cherry St", "Sullivan St ", " Washington Sq", "Avenue D ", "Madison St ", " Clinton St", "Stanton St ", " Mangin St", " Flushing Ave", "Monroe St ", "W 13 St ", "Bank St ", "W Broadway ", " Ridge St", "Emerson Pl ", "Bayard St ", " Baxter St", "Bialystoker Pl ", " Delancey St", "E 11 St ", "West Thames St", " Grand Ave", "Carmine St ", "Washington Pl ", "Franklin Ave ", "Mercer St ", " Bleecker St", "John St ", " William St", "W 31 St ", "University Pl ", "Greenwich Ave ", " Charles St", " Waverly Ave", " Berry St", "Clark St ", " Henry St", "Jay St ", " Tech Pl", "E 5 St ", "E 9 St ", " Avenue C", "Lefferts Pl ", "Fulton St ", " Clermont Ave", "Atlantic Ave ", " Furman St", "Pitt St ", "Allen St ", " E 22 St", "E 2 St ", "Hicks St ", " Montague St", " Poplar St", "Market St ", " Cherry St", " Skillman St", "E 6 St ", " Avenue D", " Canal St", " Anchorage Pl", "Cumberland St ", "Barclay St ", " Church St", " Gold St", "Carlton Ave ", "W 59 St ", "W 54 St ", "West St ", " Chambers St", "Bus Slip ", " State St", "York St ", " Jay St", "Hanover Pl ", "E 7 St ", "W 21 St ", "Hancock St ", "Macon St ", " Nostrand Ave", "E 4 St ", "E 45 St ", "E 52 St ", "W 27 St ", "Bedford Ave ", " S 9th St", "E 10 St ", "W 24 St ", " E 44 St", "E 53 St ", " W 58 St", "S 4 St ", " Wythe Ave", "W 22 St ", "W 25 St ", "Dean St ", " 4 Ave", " W 55 St", " Havemeyer St", "E 32 St ", "5 Ave ", " E 29 St", " Irving Pl", "E 31 St ", "W 41 St ", "S 3 St ", "W 15 St ", "E 12 St ", "W 44 St ", "W 37 St ", "W 39 St ", "10 Ave ", " W 28 St", "W 33 St ", "W 26 St ", "W 47 St ", "E 16 St ", " W 32 St", " W 60 St", "Henry St ", " Grand St", "E 20 St ", "E 25 St ", "9 Ave ", "W 51 St ", "E 14 St ", " Avenue B", "W 29 St ", "W 56 St ", "E 47 St ", "E 41 St ", " Madison Ave", "W 52 St ", "W 38 St ", "W 43 St ", " Classon Ave", " Joralemon St", "Cleveland Pl ", " Spring St", "E 39 St ", "Liberty St ", "Gallatin Pl ", " Livingston St", "Cadman Plaza E ", " S Portland Ave", "Myrtle Ave ", " St Edwards St", "Mott St ", " Prince St", "DeKalb Ave ", "Elizabeth St ", " Hester St", "Howard St ", " Centre St", " Greene Ave", "Concord St ", " Bridge St", "Grand Army Plaza ", " Central Park S", "Lafayette St ", " E 8 St", "3 Ave ", " Battery Pl", "Murray St ", " West St", "Washington Ave ", " Park Ave", "Clinton St ", " Tillary St", "Vesey Pl ", " River Terrace", "W 20 St ", " 7 Ave", "Old Slip ", " Front St", "Columbia St ", " Rivington St", "W Houston St ", " Hudson St", "S Portland Ave ", " Hanson Pl", "Christopher St ", " Greenwich St", "William St ", " Pine St", "Clinton Ave ", " Myrtle Ave", "2 Ave ", "W 42 St ", "S 5 Pl ", " S 4 St", "Water - Whitehall Plaza", "Metropolitan Ave ", " Bedford Ave", "Lexington Ave ", " E 26 St", "E 23 St ", "Front St ", " Washington St", "Sands St ", " Navy St", "Wythe Ave ", " Metropolitan Ave", "1 Ave ", " E 18 St", "Railroad Ave ", " Kay Ave", "Central Park S ", "Little West St ", " 1 Pl", "Grand St ", " Greene St", "E 27 St ", "E 43 St ", " 2 Ave", "W 45 St ", "E 59 St ", " Sutton Pl", "South End Ave ", " Liberty St", "Willoughby Ave ", " Walworth St", "W 4 St ", " 7 Ave S", "Centre St ", " Worth St", "Duffield St ", " Willoughby St", "Bond St ", " Schermerhorn St", "Lafayette Ave ", " St James Pl", "Washington St ", " Gansevoort St", "Suffolk St ", " Stanton St", "Pearl St ", " Hanover Square", "Clermont Ave ", " Lafayette Ave", "E 3 St ", "E 13 St ", " Avenue A", "St Marks Pl ", "8 Ave ", "E 51 St ", "11 Ave ", "E 56 St ", " 3 Ave", "Rivington St ", " Chrystie St", "W 53 St ", "Broadway ", "E 24 St ", "E 17 St ", "FDR Drive ", " E 35 St", "W 46 St ", "12 Ave ", " W 40 St", "E 42 St ", " Vanderbilt Ave", "W 34 St ", "E 33 St ", " 1 Ave", "Forsyth St ", "W 49 St ", "E 30 St ", " Park Ave S", "6 Ave ", " Broome St", "Catherine St ", " Monroe St", "E 55 St "]
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
    	return [Station.new("address" => "No Stations available, try again")]
    end
end

	    cs1 = params[:cs1]
	    cs2 = params[:cs2]
	    @Stations = []

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
