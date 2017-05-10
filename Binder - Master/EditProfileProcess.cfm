<style type="text/css">
body {
	background-color: #A8FFA8;
}
</style>

<title>Update Profile Process | Binder</title>

<CFIF isDefined("Form.SaveChanges")>
<CFQUERY NAME="UpdateRecord" DATASOURCE="ISBC490-SP2017">
	UPDATE USERS
	SET FIRST_NAME = '#form.FirstName#',
   		LAST_NAME = '#form.LastName#', 
    	USER_PHONE = '#form.Phone#'
        WHERE USER_EMAIL=<cfqueryparam value="#cookie.UserAccount#">  
</CFQUERY>
</CFIF>

<CFIF isDefined("form.ChangePassword")>
<CFIF Form.NewPassword NEQ Form.Password2 AND Form.NewPassword NEQ "">
  <CFLOCATION URL="ProfileSettings.cfm?Message=#URLEncodedFormat("The passwords you entered on the login screen do not match")#">
  <CFABORT>
<CFELSE>
<CFQUERY NAME="UpdatePassword" DATASOURCE="ISBC490-SP2017">
	UPDATE USERS
    	SET PASSWORD = '#Hash(Form.NewPassword)#'
        WHERE USER_EMAIL=<cfqueryparam value="#cookie.UserAccount#">  
</CFQUERY>
</CFIF>
</CFIF>



<CFLOCATION URL="ProfileSettings.cfm?Message=#URLEncodedFormat("Profile Successfully Updated!")#">
