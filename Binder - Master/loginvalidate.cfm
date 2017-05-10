<title>Login Validate | Binder</title>

<cfcookie name="UserAccount" value="#Email#"> </cfcookie>

<CFQUERY NAME="ValidateUser" DATASOURCE="ISBC490-SP2017">
    SELECT FIRST_NAME, LAST_NAME, ACTIVE, ADMIN
    FROM USERS WHERE USER_EMAIL='#Form.Email#'
    AND PASSWORD = '#Hash(Form.Password)#'
</CFQUERY>

<CFIF ValidateUser.ACTIVE EQ 'N'> 
  <CFLOCATION URL="login.cfm?Message=#UrlEncodedFormat("Your account has not been validated. Please wait for an email from our admin team.")#&Email=#Email#" ADDTOKEN="no">
  <CFABORT>
  
<CFELSEIF ValidateUser.ADMIN EQ 'Y'>
       <CFLOCATION URL="AdminAccountHome.cfm" ADDTOKEN="no">
       
<CFELSEIF ValidateUser.ADMIN EQ 'N'>
        <CFLOCATION URL="ProfileSettings.cfm" ADDTOKEN="no">
        
<CFELSE>
   <CFLOCATION URL="login.cfm?Message=#UrlEncodedFormat("Invalid Login. Please Try Again")#&Email=#Email#" ADDTOKEN="no">
</CFIF>
