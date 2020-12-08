(:Shows all the Waste Centres a customer has access to:)

declare function local:waste_centre_retrieval()
{
    let $waste_capacity := doc("WasteCentre.xml")/WasteCentre/WasteCentre/WasteCentre.capacity
    return

    <check_for_max_capacity_in_the_centre>
    {if (every $j in $waste_capacity satisfies fn:empty($j)) then "Go to Waste Centre."
     else "Do no go to Waste Centre.",
     let $full_capacity := for $j in $waste_capacity return ("Waste Centres: ", string($j))
     return ($full_capacity)
    }
    </check_for_max_capacity_in_the_centre>
};

local:waste_centre_retrieval()