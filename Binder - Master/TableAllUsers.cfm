<CFQUERY NAME="GetRecord" DATASOURCE="ISBC490-SP2017">


         SELECT FIRST_NAME, LAST_NAME, USER_PHONE, USER_EMAIL, PASSWORD
         FROM USERS
</CFQUERY>     

<HTML>
<HEAD>
    <TITLE>Accounts Table | Binder</TITLE>
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
<H3>Here are all of the record details for the Binder User Database...</H3>

<TABLE CELLPADDING="3" CELLSPACING="0">
<TR BGCOLOR="#888888">
    <!---<TH>ID</TH>--->
    <TH>First Name</TH>
    <TH>Last Name</TH>
    <TH>Phone</TH>
    <TH>Email</TH>
</TR>


<CFOUTPUT QUERY="GetRecord">
<TR BGCOLOR="##C0C0C0">
    <!---<TD>#USER_ID#</TD>--->
    <TD>#FIRST_NAME#</TD>
    <TD>#LAST_NAME#</TD>
    <TD>#USER_PHONE#</TD>
    <TD>#USER_EMAIL#</TD>
</TR>    
</CFOUTPUT>
</TABLE>
<p>&nbsp;</p>
<p>Click <a href="Index.cfm">here</a> to return to the main menu.</p>


</CENTER>
</BODY>
</HTML>
