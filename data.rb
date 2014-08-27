
def cbdata(file)
myArray = []

#332 being the number of stations
for i in (0..332)
	myArray[i] = []

end

myArray2 = []


CSV.foreach(file) do |row|

	  for a in (0...row.length)
	  	 myArray[a] << row[a].to_i 
	  	end
end

for j in (0..332)
for i in (0...141)
   myArray2[j] = []
   myArray2[j] << array[j][i+1] - array[j][i]
end

coolArray = [myArray, myArray2]

return coolArray


end
