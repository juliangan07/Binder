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
<CFQUERY NAME="GetRecord" DATASOURCE="ISBC490-SP2017">
         SELECT USER_EMAIL
         FROM USERS
         WHERE USER_EMAIL='#URL.Email#'
</CFQUERY>

<TITLE>Update Account Info | Binder</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</HEAD>

<BODY>
<cfinclude template="global_header.cfm">

<div class="container">
    <CENTER>
    <H2>&nbsp;</H2>
    <H2>Change Your Password</H2>
      <CFOUTPUT>
    <FORM ACTION="AdminChangePasswordProcess.cfm?Email=#GetRecord.USER_EMAIL#" METHOD="post">
        <INPUT TYPE="hidden" NAME="Email" VALUE="#GetRecord.USER_EMAIL#"> 
    </CFOUTPUT>
          
    <INPUT TYPE="hidden" NAME="NewPassword_Required" VALUE="Password is a required field">
    
    <CFOUTPUT>
    <TABLE>
    <TR>
      <TD>Email: &nbsp;</TD>
      <TD>#GetRecord.USER_EMAIL#</TD>
    </TR>
    
    <TR>
      <TD>New Password: &nbsp;</TD>
      <TD><INPUT TYPE="password" NAME="NewPassword" SIZE="10" MAXLENGTH="80"></TD>
    </TR>
    <TR>
      <TD>Confirm Password: &nbsp;</TD>
      <TD><INPUT TYPE="password" NAME="Password2" SIZE="10" MAXLENGTH="80"></TD>
    </TR>
    
    
    </TABLE>
    </CFOUTPUT>
    <br />
    <INPUT TYPE="submit" VALUE="Submit">
    </FORM>
    
    <p></p>
    <p>Click <a href="AdminAccountHome.cfm">here</a> to return to the main menu.</p>
    </CENTER>
</div>

<cfinclude template="global_footer.cfm">

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</BODY>
</HTML>
