<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/styles.css">
  <link rel="icon" type="image/png" href="./images/favicon-32x32.png" sizes="32x32" />
  <link href="https://fonts.googleapis.com/css?family=Alegreya|Cabin:400,500|Catamaran:400,500|Crimson+Text:600|Harmattan|Libre+Baskerville|Noto+Serif|PT+Serif:400i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Dosis:300,400|Indie+Flower|Poppins:500|Quicksand|Raleway:500|Titillium+Web:600,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Annie+Use+Your+Telescope" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Merienda+One" rel="stylesheet">

        <CFQUERY NAME="CurrentAccount" DATASOURCE="ISBC490-SP2017">
        
        
            SELECT FIRST_NAME, LAST_NAME, USER_PHONE, USER_EMAIL
                 FROM USERS
                 WHERE USER_EMAIL=<cfqueryparam value="#cookie.UserAccount#">
        </CFQUERY>

<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Account Home | Binder</title>
</head>

<BODY>
<CFINCLUDE TEMPLATE="globaL_header.cfm">

<div class="container">
    <div align='right'>
        <cfoutput>Current User: #cookie.UserAccount#</cfoutput></div>
    <div align="center">
      <CFIF IsDefined('URL.Message')>
        <CFOUTPUT>
          <FONT COLOR="Red">#URL.Message#</FONT>
        </CFOUTPUT>
        <P>
      </CFIF>
    </div>
    <CENTER>
      <H2>&nbsp;</H2>
      <H3>Welcome, <cfoutput query="CurrentAccount">#CurrentAccount.FIRST_NAME#</cfoutput>!</H3>
    <H3>Here are all of the record details for the Binder User Database...</H3>
    
    <TABLE CELLPADDING="3" CELLSPACING="0">
    <TR BGCOLOR="#888888">
        <TH>First Name</TH>
        <TH>Last Name</TH>
        <TH>Phone</TH>
        <TH>Email</TH>
    </TR>
    
    
    <CFOUTPUT QUERY="CurrentAccount">
    <TR BGCOLOR="##C0C0C0">
        <TD>#FIRST_NAME#</TD>
        <TD>#LAST_NAME#</TD>
        <TD>#USER_PHONE#</TD>
        <TD>#USER_EMAIL#</TD>
    </TR>    
    </CFOUTPUT>
    </TABLE>
    <p>&nbsp;</p>
    <p>Click <A HREF="EditProfile.cfm">here</A> to EDIT the User Record</p>
    </p>
    <p>Click <a href="ChangePassword.cfm">here</a> to CHANGE Your Password
    </p>
    <p>Click <A HREF="DeleteProfile.cfm">here</A> to DELETE the User Record</p>
    <p></p>
    </CENTER>
    
    
    <!--- <p align="center"><a href="Logout.cfm">Click here to log out</a>.</p> --->

</div>

<cfinclude template="global_footer.cfm">

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>