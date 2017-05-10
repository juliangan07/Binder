
<style type="text/css">
body {
	background-color: #A8FFA8;
}
</style>

<title>Update Profile Process | Binder</title>

<cfoutput>#URL.Email#</cfoutput>
<CFIF Form.NewPassword NEQ Form.Password2 AND Form.NewPassword NEQ "">
  The passwords you entered on the login screen do not match.  Please 
  hit your browser's back button and try again.
  <CFABORT>
</CFIF>     

<cfoutput>
<CFQUERY NAME="UpdatePassword" DATASOURCE="ISBC490-SP2017">
	UPDATE USERS
    	SET PASSWORD = '#Hash(Form.NewPassword)#'
        WHERE USER_EMAIL='#URL.Email#'  
</CFQUERY>
</cfoutput>

<CFLOCATION URL="AdminAccountHome.cfm?Message=#URLEncodedFormat("Password successfully
                 changed.")#">
