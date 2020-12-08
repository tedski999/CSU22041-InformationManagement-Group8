(:Shows all the Waste Centres a customer has access to:)

declare function local:waste_centre_retrieval()
{
    let $customer_bin := doc("Customer.xml")/Customer/Customer.bin/Bin/WasteContainer/WasteContainer.capacity
    
    let $centres := for $capacity in doc("WasteCentre.xml")/WasteCentres/WasteCentre/WasteCentre.capacity
      where $customer_bin <= $capacity
        return $capacity/../WasteCentre.name
    return $centres
};

local:waste_centre_retrieval()