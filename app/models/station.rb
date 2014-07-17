class Station < ActiveRecord::Base
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