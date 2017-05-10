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

<CFQUERY NAME="GetPost" DATASOURCE="ISBC490-SP2017">
        SELECT POST_NUMBER, FIRST_NAME+' '+LAST_NAME AS SELLER_NAME, POSTED.USER_EMAIL, POSTED.ISBN, BOOKS.TITLE, POSTED.PRICE
        FROM POSTED, BOOKS, USERS
        WHERE POSTED.ISBN=BOOKS.ISBN
        AND POSTED.USER_EMAIL=USERS.USER_EMAIL
        AND POST_NUMBER=#URL.PostNo#
</CFQUERY>


<div class="content container">
  <div class="row">

<div class="container">
<cfoutput>

  <h2>Contact Seller</h2>

  <div class="row">
    <section class="col-xs-12">      
<form NAME="ContactSeller" ACTION="ContactSellerProcess.cfm" METHOD="POST" onSubmit="return formCheck()">

<CFOUTPUT>
<INPUT TYPE="hidden" NAME="SellerEmail" VALUE="#GetPost.USER_EMAIL#"> 
<INPUT TYPE="hidden" NAME="BuyerEmail" VALUE="#cookie.UserAccount#">   
<INPUT TYPE="hidden" NAME="PostNumber" VALUE="#GetPost.POST_NUMBER#">   
<INPUT TYPE="hidden" NAME="Message_required" VALUE="You must include a message for the seller of this book.">
<INPUT TYPE="hidden" NAME="Authorize_required" VALUE="You must authorize Binder to send your information to the seller.">
</cfoutput>

  <div class="form-group">
    <label for="emailTo">To: #GetPost.SELLER_NAME#</label>
    <input class="form-control" type="text" maxlength="255" Value="#GetPost.USER_EMAIL#" 
           placeholder="Email" readonly>
  </div>

  <div class="form-group">
    <label for="emailFrom">From:</label>
	<input class="form-control" type="text" maxlength="255" Value="#cookie.UserAccount#" 
           placeholder="Email" readonly>
  </div>

  <div class="form-group">
    <label for="book">Book:</label>
    <input class="form-control" type="text" maxlength="255" Value="#GetPost.TITLE#" 
           placeholder="Title" readonly>
  </div>
	
  <div class="form-group">
    <label for="price">Price:</label>
    <div class="input-group">
    <span class="input-group-addon">$</span>
    <input class="form-control" maxlength="15" Value="#GetPost.PRICE#" 
           placeholder="Price" readonly type="number">
    </div>
  </div>
  
  <div class="form-group">
    <label for="comments">Note to Seller:</label>
    <textarea class="form-control" id="comments" Name="Message" cols="50" rows="3"></textarea>
  </div>

  <div class="checkbox">
    <label>
    <input id="Consent" type="checkbox" NAME="Authorize">
    I hereby authorize Binder to send the above information to the seller.</label>
  </div>

  <input class="btn btn-default pull-right" type="submit" value="Request Book" Name="Submit">
  
</form>
</cfoutput>
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