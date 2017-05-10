<style type="text/css">
body {
	background-color: #A8FFA8;
}
</style>

<title>Login Registration Process | Binder</title>

<CFIF Form.Email NEQ Form.Email2>
  The Email Addresses you entered on the login screen do not match.  Please 
  hit your browser's back button and try again.
  <CFABORT>
</CFIF>  

<CFIF Form.Email DOES NOT CONTAIN "@und.edu">
  The Email Addresses you entered is not a UND Email address  Please 
  hit your browser's back button and try again.
  <CFABORT>
</CFIF>  

<CFIF Form.Password NEQ Form.Password2>
  The passwords you entered on the login screen do not match.  Please 
  hit your browser's back button and try again.
  <CFABORT>
</CFIF>  


<CFQUERY NAME="CheckPK" DATASOURCE="ISBC490-SP2017">
    SELECT USER_EMAIL FROM USERS WHERE USER_EMAIL = '#Form.Email#'
</CFQUERY>
<CFIF CheckPK.RecordCount GT 0>
  <CFLOCATION URL="Registration.cfm?Message=#URLEncodedFormat("The
              Email Address you entered is already associated with an account.")#&amp;Email=#URLEncodedFormat(Email)#">
</CFIF>    


<CFQUERY NAME="AddUser" DATASOURCE="ISBC490-SP2017">
         INSERT INTO USERS(FIRST_NAME, LAST_NAME, USER_PHONE, USER_EMAIL, PASSWORD, ACTIVE, ADMIN)
         VALUES('#Form.FirstName#', '#Form.LastName#', '#Form.Phone#', '#Form.Email#', 
                '#Hash(Form.Password)#', 'N', 'N')
</CFQUERY>
<!---<cfinclude template="dev2.business.und.edu">--->
<CFLOCATION URL="login.cfm?Message=#URLEncodedFormat("Profile successfully
                 created. Please login below")#">
