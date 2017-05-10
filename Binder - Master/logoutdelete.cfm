<CFIF <!---(IsDefined('Form.Delete') AND Trim(Form.Delete) EQ "Delete Record") 
   OR --->(IsDefined('URL.Action') AND URL.Action EQ "Delete")>
  <CFQUERY NAME="DeleteRecord" DATASOURCE="ISBC490-SP2017">
           DELETE FROM USERS
         WHERE USER_EMAIL=<cfqueryparam value="#cookie.UserAccount#">
  </CFQUERY>
</CFIF>

<title>Logout | Binder</title>
<CFLOCATION URL="Index.cfm?Message=#URLEncodedFormat("Your account has been successfully deleted and you have been logged out of the system.")#">
