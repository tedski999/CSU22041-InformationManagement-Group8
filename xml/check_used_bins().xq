declare function local:check_used_bins(){
  let $waste := doc("Bins")/Bin/WasteContainer/WasteContainer.waste
  return 
  <check_empty_waste>
    {if (every $j in $waste//Waste satisfies fn:empty($j)) then "Empty Waste."
    else "Waste is not empty. ", 
    let $contains_waste := for $j in
    $waste/Waste return ("Waste Type and weight: ", string($j)) 
    return ($contains_waste)}
  </check_empty_waste>
};

local:check_used_bins()