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
  <title>Update Account Info | Binder</title>
</head>
<body>
<cfinclude template="global_header.cfm">
  
<CENTER>

<cfoutput>
<CFQUERY NAME="UserStatus" DATASOURCE="ISBC490-SP2017">
         SELECT USER_EMAIL, ADMIN
         FROM USERS
         WHERE USER_EMAIL=<cfqueryparam value="#cookie.UserAccount#">
</CFQUERY>
</cfoutput>

<CFQUERY NAME="GetRecent" DATASOURCE="ISBC490-SP2017">
         SELECT MAX(POST_NUMBER) AS LASTPOST
         FROM POSTED
</CFQUERY>

<cfif IsDefined('URL.Updated')>
<CFQUERY NAME="GetPost" DATASOURCE="ISBC490-SP2017">
         SELECT POST_NUMBER, TITLE, POSTED.ISBN, CLASS_CODE, PRICE, CONDITION, COMMENTS
         FROM POSTED, BOOKS
         WHERE POSTED.ISBN=BOOKS.ISBN
         AND POST_NUMBER=#URL.Updated#
</CFQUERY>
<cfelse>
<CFQUERY NAME="GetPost" DATASOURCE="ISBC490-SP2017">
         SELECT POST_NUMBER, TITLE, POSTED.ISBN, CLASS_CODE, PRICE, CONDITION, COMMENTS
         FROM POSTED, BOOKS
         WHERE POSTED.ISBN=BOOKS.ISBN
         AND POST_NUMBER=#GetRecent.LASTPOST#
</CFQUERY>
</cfif>

<H2>Review Your Post</H2>

<div align="center">
  <CFIF IsDefined('URL.Message')>
    <CFOUTPUT>
      <FONT COLOR="Red">#URL.Message#</FONT>
    </CFOUTPUT>
    <P>
  </CFIF>
</div>

  
  <CFOUTPUT>
</CFOUTPUT>
      
<!--- <p align="center">Here are the details of your most recent post.</p> --->

<CFOUTPUT>
<TABLE>
<TR>
  <TD><h4>Class Code: &nbsp; &nbsp;</h4></TD>
  <td><h4>#GetPost.CLASS_CODE#</h4></td>
</TR>
<TR>
  <TD><h4>ISBN: &nbsp; &nbsp;</TD>
  <TD><h4>#GetPost.ISBN#</h4></TD>
</TR>
<TR>
  <TD><h4>Book: &nbsp; &nbsp;</h4></TD>
  <TD><h4>#GetPost.TITLE#</h4></TD>
</TR>
<TR>
  <TD><h4>Price: &nbsp; &nbsp;</h4></TD>
  <TD><h4>#GetPost.PRICE#</h4></TD>
</TR>
<TR>
  <TD><h4>Condition: &nbsp; &nbsp;</h4></TD>
  <TD><h4>#GetPost.CONDITION#</h4></TD>
</TR>
<TR> 
  <TD><h4>Comments: &nbsp; &nbsp;</h4></TD>
  <TD><h4>#GetPost.COMMENTS#</h4></TD>
</TR>

</TABLE>

<br />

<a href="Default.cfm" class="btn btn-default btnSignInColor">Back to Home</a>

</CFOUTPUT>

<!--- <cfif #UserStatus.ADMIN# EQ 'Y'>
	<p>Click <a href="AdminAccountHome.cfm">here</a> to return to the main menu.</p>
    <cfelseif #UserStatus.ADMIN# EQ 'N'>
<p>Click <a href="AccountHome.cfm">here</a> to return to the main menu.</p>
	<cfelse>
    	THERE HAS BEEN AN ERROR. CLICK THE BACK BUTTON ON YOUR BROWSER.
</cfif> --->
</CENTER>

<cfinclude template="global_footer.cfm">

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
