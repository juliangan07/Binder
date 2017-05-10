<title>Logout | Binder</title>

<cfset structDelete(cookie, "UserAccount") />
<CFLOCATION URL="default.cfm?Message=#URLEncodedFormat("You have been successfully logged out. Please visit again soon!")#">
