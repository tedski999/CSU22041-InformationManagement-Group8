declare function local:schedule_driver_routes()
{
  let $Driver.route := doc("Driver.xml")/Driver/Driver.route/Route
  
  let $route := for $j in
   $Driver.route//Route.stop return("Stop: ", string($j)) 
   
  let $start := $Driver.route/string(Route.startLocation)
  let $end := $Driver.route/string(Route.endLocation)
  
  return ("Start Location: ", $start, "", $route, "", "End Location: ", $end)
};

local:schedule_driver_routes()