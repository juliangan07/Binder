
  <style type="text/css">
  body {
	  	background-color: #FF9D9D;
  }
  </style>
  
<CENTER>


<CFQUERY NAME="GetRecord" DATASOURCE="ISBC490-SP2017">
         SELECT FIRST_NAME, LAST_NAME, USER_PHONE, USER_EMAIL
         FROM USERS
         WHERE USER_EMAIL='#URL.Email#'
</CFQUERY>

<HTML>
<HEAD>
    <TITLE>Update Account Info | Binder</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
body {
	background-color: #FF9D9D;
}
</style>
</HEAD>

<BODY>
<CENTER>
<H2>&nbsp;</H2>
<H2>Delete Your Account</H2>
  
  <CFOUTPUT>
</CFOUTPUT>
      
<p align="center"> Are you sure you would like to delete your account?</p>
<CFOUTPUT>
<TABLE>
<TR>
  <TD>First Name: #GetRecord.FIRST_NAME#</TD>
</TR>
<TR>
  <TD>Last Name: #GetRecord.LAST_NAME#</TD>
</TR>
<TR>
  <TD>Phone Number: #GetRecord.USER_PHONE#</TD>
</TR>
<TR>
  <TD>Email Address: #GetRecord.USER_EMAIL#</TD>
</TR>

</TABLE>


<p></p>
<p>Yes, <a href="AdminDeleteProcess.cfm?Email=#GetRecord.USER_EMAIL#&Action=Delete">delete this account</a>.</p>
<p>No, <a href="AdminAccountHome.cfm">take me back</a> to the main menu.</p>
</CFOUTPUT>
</CENTER>
</BODY>
</HTML>
