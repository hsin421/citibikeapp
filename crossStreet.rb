
Stations.all.each do |station|
	 station.update("cross_st1"=> station.address.split("&")[0], "cross_st2" => station.address.split("&")[1])
end 

