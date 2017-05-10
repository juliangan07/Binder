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
    SELECT FIRST_NAME, LAST_NAME, USER_PHONE, USER_EMAIL, PASSWORD, ADMIN, ACTIVE
    FROM USERS
    ORDER BY LAST_NAME,FIRST_NAME;
</CFQUERY>

<CFQUERY NAME="CurrentAccount" DATASOURCE="ISBC490-SP2017">
	SELECT FIRST_NAME, LAST_NAME, USER_PHONE, USER_EMAIL, PASSWORD, ADMIN, ACTIVE
	FROM USERS
	WHERE USER_EMAIL=<cfqueryparam value="#cookie.UserAccount#">
</CFQUERY>

<CFQUERY NAME="GetPosts" DATASOURCE="ISBC490-SP2017">
    SELECT POST_NUMBER, POSTED.ISBN, USER_EMAIL, TITLE, PRICE, CONDITION, COMMENTS, CLASS_CODE
    FROM POSTED, BOOKS
    WHERE POSTED.ISBN=BOOKS.ISBN
    AND USER_EMAIL=<cfqueryparam value="#cookie.UserAccount#">
    ORDER BY CLASS_CODE, POST_NUMBER;
</CFQUERY>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
      <H3>Welcome, <cfoutput query="CurrentAccount">#CurrentAccount.FIRST_NAME#</cfoutput>!</H3>
    <H3>Here are all of the record details for the Binder User Database...</H3>
    <TABLE CELLPADDING="3" CELLSPACING="0" style="width: 80%">
    <TR BGCOLOR="#888888">
        <TH>First Name</TH>
        <TH>Last Name</TH>
        <TH>Phone</TH>
        <TH>Email</TH>
        <TH>Admin</TH>
        <TH>Active User</TH>
        <TH>           </TH>
        <TH>           </TH>
        <TH>           </TH>    
    </TR>
    
    
    <CFOUTPUT QUERY="GetRecord">
    <TR BGCOLOR="##C0C0C0">
        <TD>#FIRST_NAME#</TD>
        <TD>#LAST_NAME#</TD>
        <TD>#USER_PHONE#</TD>
        <TD>#USER_EMAIL#</TD>
        <TD>
            <cfif '#ADMIN#' EQ'N'>
                <a href="AdminMakeAdmin.cfm?Admin=N&Email=#USER_EMAIL#">Make Admin</a>
            <cfelseif '#ADMIN#' EQ 'Y' AND '#USER_EMAIL#' NEQ 'shane.a.herman@und.edu'>
                <a href="AdminMakeAdmin.cfm?Admin=Y&Email=#USER_EMAIL#">Remove Admin</a>
                
             <cfelse>
                    Main Admin
                </cfif> </TD>
                
                
        <TD>
            <cfif '#ACTIVE#' EQ'N'>
                <a href="AdminActivateAccount.cfm?Active=N&Email=#USER_EMAIL#">Activate</a>
            <cfelseif '#ACTIVE#' EQ 'Y'>
                <a href="AdminActivateAccount.cfm?Active=Y&Email=#USER_EMAIL#">Deactivate</a>
                </cfif> </TD>
        <TD><A HREF="AdminEditProfile.cfm?Email=#USER_EMAIL#">EDIT</A></TD>
        <TD><A HREF="AdminChangePassword.cfm?Email=#USER_EMAIL#">PASSWORD</A></TD>
        <TD><A HREF="AdminDeleteProfile.cfm?Email=#USER_EMAIL#">DELETE</A></TD>          
    </TR>    
    </CFOUTPUT>
    </TABLE>
    
 <h3>Here are all the books you have posted.</h3>

<TABLE CELLPADDING="3" CELLSPACING="0" style="width: 80%">
<TR BGCOLOR="#888888">
    <TH>Post Number</TH>
    <TH>Class Code</TH>
    <TH>Book ISBN</TH>
    <TH>Book Title</TH>
    <TH>Price</TH>
    <TH>Condition</TH>
	<TH>           </TH>
	<TH>           </TH>    
</TR>

<CFOUTPUT QUERY="GetPosts">
<TR BGCOLOR="##C0C0C0">
    <TD>#POST_NUMBER#</TD>
    <TD>#CLASS_CODE#</TD>
    <TD>#ISBN#</TD>
    <TD>#TITLE#</TD>
    <TD>$#PRICE#</TD>
    <TD>#CONDITION#</TD>
	<TD><A HREF="PostBook.cfm?Edit=#POST_NUMBER#&Class=#CLASS_CODE#">EDIT</A></TD>
	<TD><A HREF="PostDeleteProcess.cfm?PostNo=#POST_NUMBER#&Action=Delete">DELETE</A></TD>          
</TR>    
</CFOUTPUT>
</TABLE>
<!--- <cfoutput>
    <p>Click <A HREF="AdminEditProfile.cfm?Email=#cookie.UserAccount#">here</A> to EDIT your Administrator Profile</p>
    <p>Click <a href="AdminChangePassword.cfm?Email=#cookie.UserAccount#">here</a> to CHANGE Your Administrator Password
    </p>
    <p>Click <A HREF="AdminDeleteProfile.cfm?Email=#cookie.UserAccount#">here</A> to DELETE Your Administrator Account</p>
    <p></p>

    </CENTER>


<p align="center"><a href="Logout.cfm">Click here to log out</a>.</p> 
</cfoutput>--->

<br />

<a href="ViewAllPosts.cfm" class="btn btn-default">View all posted books</a>
</div>

<cfinclude template="global_footer.cfm">

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</body>
</html>