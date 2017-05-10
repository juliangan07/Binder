
<style type="text/css">
body {
	background-color: #A8FFA8;
}
</style>

<title>Update Profile Process | Binder</title>


<CFIF isDefined("Form.ChangePassword") AND Form.NewPassword NEQ Form.Password2 AND Form.NewPassword NEQ "">
  The passwords you entered on the login screen do not match.  Please 
  hit your browser's back button and try again.
  <CFABORT>
</CFIF>     


<CFQUERY NAME="UpdatePassword" DATASOURCE="ISBC490-SP2017">
	UPDATE USERS
    	SET PASSWORD = '#Hash(Form.NewPassword)#'
        WHERE USER_EMAIL=<cfqueryparam value="#cookie.UserAccount#">  
</CFQUERY>


<CFLOCATION URL="ProfileSettings.cfm?Message=#URLEncodedFormat("Password successfully
                 changed.")#">
