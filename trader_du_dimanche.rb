def trader_du_dimanche(arr)

index1 = 0
index2 = 0
benef = 0

arr.each_with_index {|prix, index|
	for x in (index + 1)...(arr.size)
		if (arr[x] - prix) > benef
			benef = arr[x] - prix
			index1 = index
			index2 = x
		end
	end
}
puts "achat le jour #{index1}, et revente le jour #{index2}. "
[index1, index2]

end

tableau = [17,3,6,9,15,8,6,1,10]

trader_du_dimanche(tableau)