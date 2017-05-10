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

<CFQUERY NAME="GetPosts" DATASOURCE="ISBC490-SP2017">
        SELECT POST_NUMBER, POSTED.ISBN, TITLE, PRICE, CONDITION, COMMENTS, CLASS_CODE, FIRST_NAME, LAST_NAME, POSTED.USER_EMAIL
        FROM POSTED, BOOKS, USERS
        WHERE POSTED.ISBN=BOOKS.ISBN
        AND POSTED.USER_EMAIL=USERS.USER_EMAIL
        ORDER BY CLASS_CODE, POST_NUMBER;
    </CFQUERY>

<title>See All Posts | Binder</title>
</head>

<BODY>
<cfinclude template="global_header.cfm">

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

<p><h2>All Posted Books</p>
</h2>
<p>Below you will find a listing of all of the books users have posted to the database.
  
<TABLE CELLPADDING="3" CELLSPACING="0" style="width:100%;">
<TR BGCOLOR="#888888">
    <TH>Post No.</TH>
    <TH>Class Code</TH>
    <TH>Book ISBN</TH>
    <TH>Book Title</TH>
    <TH>Price</TH>
    <TH>Condition</TH>
    <TH>Comments</TH>
    <TH>User Name</TH>
	<TH>           </TH>
	<TH>           </TH>    
</TR>

<CFOUTPUT QUERY="GetPosts">
<TR BGCOLOR="##C0C0C0">
    <TD>#POST_NUMBER#</TD>
    <TD>#CLASS_CODE#</TD>
    <TD>#ISBN#</TD>
    <TD>#TITLE#</TD>
    <TD>#PRICE#</TD>
    <TD>#CONDITION#</TD>
    <TD>#COMMENTS#</TD>
    <TD>#FIRST_NAME# #LAST_NAME#</TD>
	<TD><A HREF="PostBook.cfm?Edit=#POST_NUMBER#&Class=#CLASS_CODE#">EDIT</A></TD>
	<TD><A HREF="PostDeleteProcess.cfm?AllPosts=Y&PostNo=#POST_NUMBER#&Action=Delete">DELETE</A></TD>          
</TR>    
</CFOUTPUT>
</TABLE>

</CENTER>

<br />

<p align="center"><a href="AdminAccountHome.cfm" class="btn btn-default">Back to Profile</a></p>
</div>

<cfinclude template="global_footer.cfm">

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
<body>
</body>
</html>