(: An example xquery to compare an employee with its corresponding Admin.employees entry :)
(: Would be used in the Manager Employees use case to update the Admin.employees entires :)

declare function local:validate_employee_entry($employee)
{
  let $employeeID := string($employee/@employeeID)
  let $employeeEntry := doc("Admin.xml")/Admin/Admin.employees/Employee[@employeeID = $employeeID]
  return
    if ($employeeEntry) then
      if (fn:deep-equal($employeeEntry, $employee)) then
        "Employee data is up to date!"
      else
        (
          "Employee data does not match!",
          fn:string-join(("Employee ", $employeeID), ""), $employee,
          "Employee Entry", $employeeEntry
        )
    else
      fn:string-join(("Employee ", $employeeID, " not found in Admin employees list!"), "")
};

(: Here, we compare the Driver.xml with the corresponding entry in :)
(: Admin.employees using its employeeID.                           :)
local:validate_employee_entry(doc("Driver.xml")/Driver/Employee)
