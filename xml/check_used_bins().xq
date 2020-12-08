declare function local:check_used_bins(){
  let $wasteContainer := doc("Bins.xml")/Bin/WasteContainer/WasteContainer.waste
  
  return 
  <check_empty_waste>
    {if (every $j in $wasteContainer//Waste satisfies fn:empty($j)) then "Empty Waste."
    else "Waste is not empty. ", 
    let $contains_waste := for $j in
    $wasteContainer/Waste return ("Waste Type and weight:", $j) 
    return ($contains_waste)
    }
  </check_empty_waste>
};

local:check_used_bins()
