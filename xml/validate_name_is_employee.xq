(: Checks if a given driver is actually an employee according to the Admin's employee array :)

declare function local:validate_driver_is_employee()
{
  (: Get the driver's employeeName :)
  let $driver_id := doc("Driver.xml")/Driver/Employee/Employee.employeeName
  
  (: Check for matching employeeName in Admin employee array :)
  let $match := for $employee in doc("Admin.xml")/Admin/Admin.employees
    where $driver_id = $employee/Employee/Employee.employeeName
      return $driver_id
    
  return("Is Driver on Employee List?: ", fn:exists($match))
};
local:validate_driver_is_employee()