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
  <title>Binder - Connecting students and their next textbook</title>
</head>
<body>
<cfinclude template="global_header.cfm">

<CFPARAM NAME="Book" DEFAULT="">
<CFPARAM NAME="Price" DEFAULT="">
<CFPARAM NAME="Condition" DEFAULT="">
<CFPARAM NAME="Comments" DEFAULT="">  

<cfif IsDefined('URL.Class') and IsDefined('URL.Edit') and URL.Class NEQ "">
	<CFPARAM NAME="ClassCode" DEFAULT='#URL.Class#'>
    <CFPARAM NAME="Edit" DEFAULT='#URL.Edit#'>
    <cfoutput>
    <CFQUERY NAME="GetPost" DATASOURCE="ISBC490-SP2017">
        SELECT POST_NUMBER, POSTED.ISBN, TITLE, PRICE, CONDITION, COMMENTS
        FROM POSTED, BOOKS
        WHERE POSTED.ISBN=BOOKS.ISBN
        AND POST_NUMBER=#Edit#
        ORDER BY CLASS_CODE;
    </CFQUERY></cfoutput>
    
<cfelseif IsDefined('URL.Class') and URL.Class NEQ "">
    	<CFPARAM NAME="ClassCode" DEFAULT='Trim(#URL.Class#)'>
        <CFPARAM NAME="Edit" DEFAULT="">
<cfelse>
	<CFPARAM NAME="ClassCode" DEFAULT="">
    <CFPARAM NAME="Edit" DEFAULT="">
</cfif>    

<cfquery name="Classes" DATASOURCE="ISBC490-SP2017">
SELECT DISTINCT CLASS_CODE
FROM BOOKS
ORDER BY CLASS_CODE;
</cfquery>

<div class="content container">
  <div class="row">

<div class="container">

  <h2>Post a Book</h2>

  <div class="row">
    <section class="col-xs-12">

<CFIF IsDefined('URL.Message')>
  <CFOUTPUT>
    <FONT COLOR="Red">#URL.Message#</FONT>
</CFOUTPUT>
<P>
</CFIF>

<cfif ClassCode EQ "" and Edit EQ "">
<INPUT TYPE="hidden" NAME="Class_required" 
       VALUE="You must choose a class.">
<cfoutput>       
<form NAME="CreatePost" ACTION="PostBook.cfm?Class=#ClassCode#" METHOD="POST">
</CFOUTPUT>

  <div class="form-group">
    <label for="book">Select Class:</label>
    <select class="form-control" id="classcode" name="ClassCode">
    	<CFOUTPUT QUERY="Classes">
        <OPTION value="#Classes.CLASS_CODE#">#Classes.CLASS_CODE#</OPTION>
      	</CFOUTPUT>
     </select>
  </div>

  <input class="btn btn-default pull-right" type="submit" value="Next" Name="Next">
  </form>

<cfelseif ClassCode NEQ "" and Edit NEQ "">
<cfoutput>
<FORM NAME="CreatePost" ACTION="CreatePostProcess.cfm?PostNo=#Edit#" METHOD="POST" onSubmit="return formCheck()"></CFOUTPUT>
<INPUT TYPE="hidden" NAME="Book_required" VALUE="You must choose a book.">
<INPUT TYPE="hidden" NAME="Price_required" VALUE="You must input a price for this post.">
<INPUT TYPE="hidden" NAME="Condition_required" VALUE="You must select a book condition.">

  <div class="form-group">
    <label for="book">Class Code:</label>
    <cfoutput><b>#ClassCode#</b></cfoutput>
  </div>
  
 <cfoutput>
<cfquery name="StoredBooks" DATASOURCE="ISBC490-SP2017">
    SELECT ISBN, TITLE, AUTHOR, EDITION, CLASS_CODE
    FROM BOOKS
    WHERE CLASS_CODE='#ClassCode#'
    AND ISBN='#GetPost.ISBN#'
    ORDER BY CLASS_CODE, TITLE;
</cfquery>
</cfoutput>
  
  <div class="form-group">
    <label for="book">Book:</label>
    <CFOUTPUT>
    <SELECT class="form-control" NAME="Book">
    <OPTION value="#GetPost.ISBN#" Selected="#GetPost.ISBN#">#StoredBooks.Title# - #StoredBooks.AUTHOR#</OPTION>
    </SELECT>
	</CFOUTPUT>
  </div>

  <div class="form-group">
    <label for="price">Price:</label>
    <CFOUTPUT>
    <div class="input-group">
    <span class="input-group-addon">$</span>
    <input class="form-control" type="Number" Size="15" STEP="any" maxlength="255" Value="#GetPost.Price#" 
        name="Price">
    </CFOUTPUT>
    </div>
  </div>

  <CFOUTPUT>
  <div class="form-group">
  <label for="condition">Condition:</label>
  <cfif "#GetPost.CONDITION#" EQ "New">
  <select class="form-control" id="condition" name="Condition">
    <option value="New" selected="selected">New</option>
    <option value="Like New">Like New</option>
    <option value="Good">Good</option>
    <option value="Acceptable">Acceptable</option>
    <option value="Poor">Poor</option>
  </select>
  <cfelseif "#GetPost.CONDITION#" EQ "Like New">
  <select class="form-control" id="condition" name="Condition">
    <option value="New">New</option>
    <option value="Like New" selected="selected">Like New</option>
    <option value="Good">Good</option>
    <option value="Acceptable">Acceptable</option>
    <option value="Poor">Poor</option>
  </select>
  <cfelseif "#GetPost.CONDITION#" EQ "Good">
  <select class="form-control" id="condition" name="Condition">
    <option value="New">New</option>
    <option value="Like New">Like New</option>
    <option value="Good" selected="selected">Good</option>
    <option value="Acceptable">Acceptable</option>
    <option value="Poor">Poor</option>
  </select>
  <cfelseif "#GetPost.CONDITION#" EQ "Acceptable">
  <select class="form-control" id="condition" name="Condition">
    <option value="New">New</option>
    <option value="Like New">Like New</option>
    <option value="Good">Good</option>
    <option value="Acceptable" selected="selected">Acceptable</option>
    <option value="Poor">Poor</option>
  </select>
  <cfelseif "#GetPost.CONDITION#" EQ "Poor">
  <select class="form-control" id="condition" name="Condition">
    <option value="New">New</option>
    <option value="Like New">Like New</option>
    <option value="Good">Good</option>
    <option value="Acceptable">Acceptable</option>
    <option value="Poor" selected="selected">Poor</option>
  </select>
  <CFELSE>
  	<h4>Error - Hit back button on your browser</h4>
  </div>
  </cfif>
  </CFOUTPUT>
  
  <CFOUTPUT>
  <div class="form-group">
    <label for="comments">Comments:</label>
    <textarea class="form-control" id="comments" Name="Comments" cols="50" rows="3" VALUE="#GetPost.COMMENTS#">#GetPost.COMMENTS#</textarea>
  </div>
  </CFOUTPUT>

  <input class="btn btn-default pull-right" type="submit" value="Post Book" Name="Submit">

<cfelseif ClassCode NEQ "">
<FORM NAME="CreatePost" ACTION="CreatePostProcess.cfm" METHOD="POST" 
      onSubmit="return formCheck()">
<INPUT TYPE="hidden" NAME="Book_required" 
       VALUE="You must choose a book.">
<INPUT TYPE="hidden" NAME="Price_required" 
       VALUE="You must input a price for this post.">
<INPUT TYPE="hidden" NAME="Condition_required" 
       VALUE="You must select a book condition.">
       
<div class="form-group">
    <label for="book">Class Code:</label>
    <cfoutput><b>#ClassCode#</b></cfoutput>
  </div>
  
 <cfoutput>
<cfquery name="StoredBooks" DATASOURCE="ISBC490-SP2017">
    SELECT ISBN, TITLE, AUTHOR, EDITION, CLASS_CODE
    FROM BOOKS
    WHERE CLASS_CODE='#ClassCode#'
    ORDER BY CLASS_CODE, TITLE;
</cfquery>
</cfoutput>

<div class="form-group">
    <label for="book">Book:</label>
	<select class="form-control" id="book" name="Book">
    	<CFOUTPUT QUERY="StoredBooks">
        <OPTION value="#StoredBooks.ISBN#">#StoredBooks.Title# - #StoredBooks.AUTHOR#</OPTION>
        </CFOUTPUT>
    </select>
  </div>

  <div class="form-group">
    <label for="price">Price:</label>
    <input class="form-control" type="Number" Size="15" STEP="any" maxlength="255" Value="#GetPost.Price#" 
           placeholder="Price" name="Price">
  </div>

<div class="form-group">
  <label for="condition">Condition:</label>
  <select class="form-control" id="condition" name="Condition">
    <option value="New" selected="selected">New</option>
    <option value="Like New">Like New</option>
    <option value="Good">Good</option>
    <option value="Acceptable">Acceptable</option>
    <option value="Poor">Poor</option>
  </select>
</div>

<div class="form-group">
    <label for="comments">Comments:</label>
    <textarea class="form-control" id="comments" Name="Comments" cols="50" rows="3"></textarea>
  </div>

  <input class="btn btn-default pull-right" type="submit" value="Post Book" Name="Submit">
  
</form>
</cfif>
    </section>
  </div><!-- row -->   
</div><!-- content container -->

<cfinclude template="global_footer.cfm">

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
<body>
</body>
</html>