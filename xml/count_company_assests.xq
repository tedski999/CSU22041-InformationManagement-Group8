(: An example xquery to count assigned company assets :)
(: Useful for the Manage Company Assets use case :)

declare function local:count_active_company_assests()
{
  (: Count total number of trucks and bins :)
  let $numOfTrucks := fn:count(doc("Admin.xml")/Admin/Admin.binTrucks/BinTruck)
  let $numOfBins := fn:count(doc("Admin.xml")/Admin/Admin.bins/WasteContainer)
  
  (: Return all trucks with drivers :)
  let $assignedTrucks := for $truck in doc("Admin.xml")/Admin/Admin.binTrucks/BinTruck
  where $truck/BinTruck.driver/Driver
    return $truck
  
  (: Get all the bins on these trucks :)
  let $assignedBins := for $truck in $assignedTrucks
    return $truck/BinTruck.bins/WasteContainer
    
  return (
    "Active trucks:", fn:string-join((fn:count($assignedTrucks), "/", $numOfTrucks), ""),
    "Active bins:",   fn:string-join((fn:count($assignedBins),   "/", $numOfBins),   "")
  )
};

(: In this example, both of the trucks have drivers, but only 5 out :)
(: of the 7 available bins are being used by these trucks.          :)
local:count_active_company_assests()
