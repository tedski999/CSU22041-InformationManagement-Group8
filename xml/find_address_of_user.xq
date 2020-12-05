(: An example xquery to search for the home address of a customer by their username :)
(: This may be used by the admin when creating a new route for a driver in the Schedule Route use case :)

declare function local:find_address_of_user($userName as xs:string) {

  (: Look up customer details :)
  let $customer := for $customerAccount in
    doc("Admin.xml")/Admin/Admin.customers/CustomerAccount
  where string($customerAccount/CustomerAccount.userName) = $userName
    return $customerAccount/CustomerAccount.customer/Customer

  (: Return the required address if there was a match :)
  return
    if ($customer) then
      string($customer/Customer.customerAddress)
    else
      "User not found"

};

local:find_address_of_user("matt_yale")

(: Examples :)
(:
local:find_address_of_user("han.morris")
local:find_address_of_user("mgrellan")
local:find_address_of_user("mgrellanaaa")
local:find_address_of_user("mgr")
local:find_address_of_user("")
:)
