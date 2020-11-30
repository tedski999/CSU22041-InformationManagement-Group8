(: Find the largest and smallest bins in terms of capacity inside the Driver's truck :)
let $c := /Driver//Bin/WasteContainer/WasteContainer.capacity
let $largest := fn:max($c)
let $smallest := fn:min($c)
return
  ("Largest Bin: ", $largest, "Smallest Bin: ", $smallest)