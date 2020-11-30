(: Finding any bins large than a given capacity (in this case 30) :)
let $c := /Driver//Bin[WasteContainer/WasteContainer.capacity > 30]
return
  <large_bins>
  {$c}
  </large_bins>
