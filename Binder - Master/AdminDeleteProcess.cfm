<cfoutput>

<CFIF (IsDefined('URL.Action') AND URL.Action EQ "Delete")>
  <CFQUERY NAME="DeleteRecord" DATASOURCE="ISBC490-SP2017">
           DELETE FROM USERS
         WHERE USER_EMAIL='#URL.Email#'
  </CFQUERY>
</CFIF>

<title>Logout | Binder</title>
<CFLOCATION URL="AdminAccountHome.cfm?Message=#URLEncodedFormat("The account has been successfully deleted.")#">
</cfoutput>
