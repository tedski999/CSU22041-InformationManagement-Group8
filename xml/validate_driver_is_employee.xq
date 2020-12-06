(: Checks if a given driver is actually an employee according to the Admin's employee array :)

declare function local:validate_driver_is_employee()
{
  (: Get the driver's employeeID :)
  let $driver_id := doc("Driver.xml")/Driver/Employee/@employeeID
  
  (: Check for matching employeeID in Admin employee array :)
  let $match := for $employee in doc("Admin.xml")/Admin/Admin.employees
    where $driver_id = $employee/Employee/@employeeID
      return $driver_id
    
  return("Is Driver on Employee List?: ", fn:exists($match))
};
local:validate_driver_is_employee()