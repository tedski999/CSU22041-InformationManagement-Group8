(: Checks if a skip has enough available capacity :)

declare function local:check_skip_return($skip_entry) {
  let $container_capacity := number($skip_entry/WasteContainer/WasteContainer.capacity)
  let $container_weight := number($skip_entry/WasteContainer/WasteContainer.waste/Waste/Waste.weight)
  return
  if($skip_entry) then
    (: If skip is within 10 weight of full then its ready to be collected :)
    if($container_weight > ($container_capacity - 10)) then (fn:string-join(("Container ", $skip_entry/@skipID, " is ready to retrieve")))
    else (fn:string-join(("Container ", $skip_entry/@skipID, " is not ready to retrieve")))
  else "No Entry Found"
};

local:check_skip_return(doc("skip.xml")/Skips/Skip)
