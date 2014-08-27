module StationHelper
  def warning?(station, timenow, arrayy, zerone)
    	if arrayy[station.position+1][zerone] != []
    		warntime1 = arrayy[station.position+1][zerone][0].hour.to_s + ":" + arrayy[station.position+1][zerone][0].min.to_s
    		warntime2 = arrayy[station.position+1][zerone][1].hour.to_s + ":" + arrayy[station.position+1][zerone][1].min.to_s
    		t = timenow.hour.to_s + ":" + timenow.min.to_s
    		if t > warntime1 && t < warntime2
    		return true 
    		else
    		return false
    		end 
    	else
    	 return false	
    	end
    end
    def weekend?(timenow)
    	if timenow.sunday? || timenow.saturday?
    		return true
    	else
    		return false
    	end
    end
end
