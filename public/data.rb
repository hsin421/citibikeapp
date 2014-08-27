#7-17 7:30 start Thur
#7-19 11:11 start Sat
#7-20 10:22 start Sun
#7-22 7:26 start Tue
#7-23 8:37 start Wed
#7-24 6:37 start Thur

#note: for 7-24 for loop needs 0..333

require 'csv'

#time_string format for 7-17 8:45 => "7,17,8,45"
def myTimer(time_string, position)
    mytime = Time.new(2014,time_string.split(",")[0], time_string.split(",")[1], time_string.split(",")[2], time_string.split(",")[3])
    
    return mytime + 5 * 60 * (position - 1)
end

#*************************

def cbdata(file)
myArray = []

#332 being the number of stations
for i in (0..333)
	myArray[i] = []

end

myArray2 = []

for i in (0..333)
	myArray2[i] = []

end

# if file[16..17] == "17"
#      ourtime = "7,17,7,30"
# elsif file[16..17] == "19"
#      ourtime = "7,19,11,11"
# elsif file[16..17] == "20"
#      ourtime = "7,20,10,22"
# elsif file[16..17] == "22"
#      ourtime = "7,22,7,26"
# elsif file[16..17] == "23"
#      ourtime = "7,23,8,37"
# elsif file[16..17] == "24"
     ourtime = "7,24,6,37"
#end
          
#first element made up for empty myArray[0]
docks = [3, 38, 33, 27, 62, 39, 19, 19, 31, 29, 46, 24, 19, 39, 33, 31, 33, 29, 55, 23, 26, 35, 47, 45, 47, 51, 21, 45, 28, 23, 39, 38, 33, 23, 37, 55, 27, 23, 39, 39, 39, 31, 31, 23, 23, 31, 31, 23, 20, 23, 27, 40, 27, 33, 3, 3, 38, 23, 39, 35, 27, 23, 31, 27, 35, 24, 57, 27, 23, 39, 31, 19, 25, 19, 19, 31, 59, 27, 43, 47, 19, 29, 20, 55, 31, 24, 18, 27, 35, 55, 36, 23, 31, 36, 33, 37, 31, 27, 41, 36, 30, 31, 23, 39, 29, 43, 27, 31, 35, 39, 27, 31, 39, 51, 35, 27, 39, 23, 31, 39, 27, 24, 31, 27, 36, 37, 24, 27, 19, 29, 23, 23, 35, 24, 35, 42, 23, 27, 39, 36, 27, 31, 43, 23, 27, 35, 55, 39, 43, 57, 48, 27, 31, 33, 34, 39, 35, 27, 19, 30, 43, 47, 42, 39, 36, 39, 31, 29, 43, 39, 35, 27, 31, 31, 32, 31, 32, 30, 25, 27, 31, 27, 15, 42, 42, 31, 39, 40, 34, 43, 23, 19, 35, 23, 20, 24, 42, 31, 47, 23, 23, 23, 19, 55, 39, 31, 47, 31, 27, 24, 31, 39, 27, 47, 27, 0, 27, 39, 32, 35, 51, 23, 52, 42, 39, 31, 31, 31, 59, 39, 35, 39, 35, 59, 31, 49, 23, 39, 47, 25, 59, 39, 35, 34, 59, 55, 37, 31, 41, 42, 47, 37, 46, 59, 31, 31, 27, 25, 39, 35, 44, 39, 39, 36, 41, 37, 59, 53, 49, 34, 35, 25, 47, 59, 30, 36, 52, 43, 30, 5, 45, 36, 47, 24, 34, 51, 33, 26, 27, 53, 33, 39, 55, 39, 61, 39, 67, 51, 51, 3, 39, 40, 59, 39, 41, 36, 39, 43, 50, 30, 29, 39, 39, 31, 39, 27, 38, 30, 15, 27, 30, 36, 12, 49, 24, 35, 39, 36, 39, 43, 33, 36, 25] 

CSV.foreach(file) do |row|

	  for a in (0...row.length)
	  	 myArray[a] << row[a].to_i 
	  	end
end

lng = myArray[0].length

for j in (0..333)
for i in (0...lng-1)
 
   myArray2[j] << myArray[j][i+1] - myArray[j][i]
end
end
coolArray = [myArray, myArray2]

hot = []
hot[0]=[]
for i in (1..333)
	hot[i] =[[],[]]
	ct = 0
	max3 = myArray[i].max/3
	max2 = myArray[i].max/2
	maxi = myArray[i].max
	mini = myArray[i].min
	for j in (0...lng-1)
     ct += myArray2[i][j]
     if ct > max3 && myArray2[i][j] > 0 && (docks[i] - myArray[i].max) < 4 && myArray[i][j+1] > max2
     	hot[i][0] << j   	
     	if j > myArray[i].index(maxi)
     		ct = 0
     		hot[i][0].pop
     	end
     elsif ct < -max3 && myArray2[i][j] < 0 && mini < 5 
     	hot[i][1] << j
     	if j > myArray[i].index(mini)
     		ct = 0
     		hot[i][1].pop
     	end
     end
 end
end

hotTime = []

for a in (0...hot.length)
     hotTime[a] = [[],[]]
     if hot[a][0] && hot[a][0].last
     hotTime[a][0] << myTimer(ourtime, hot[a][0].last - 5)
     hotTime[a][0] << myTimer(ourtime, hot[a][0].last + 2)
     end
     if hot[a][1] && hot[a][1].last
     hotTime[a][1] << myTimer(ourtime, hot[a][1].last - 5)
     hotTime[a][1] << myTimer(ourtime, hot[a][1].last + 2)
     end
end


coolArray = [myArray, myArray2, hot, hotTime]

return coolArray

end







