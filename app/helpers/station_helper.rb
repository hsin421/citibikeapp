module StationHelper
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
			return dist_list_sort_id[1..num]
		end

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
		for a in Station.where("cross_st1" => array1[1])
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

end
