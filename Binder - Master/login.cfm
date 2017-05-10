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
  <title>Binder - Sign In</title>
</head>
<body>
<CFPARAM NAME="Email" DEFAULT="">

<CFIF IsDefined('Cookie.Email')>
  <CFSET Email = Cookie.Email>
</CFIF>

<CFINCLUDE TEMPLATE="globaL_header.cfm">

<div class="content container">
  <div class="row">


<div class="container">

  <h2>Login</h2>

  <h6>Please login using your UND.edu email address</h6>

  <div class="row">
    <section class="col-xs-12">

<CFIF IsDefined('URL.Message')>
  <CFOUTPUT>
    <FONT COLOR="Red">#URL.Message#</FONT>
</CFOUTPUT>
<P>
</CFIF>

<form NAME="ValidateUser" ACTION="loginvalidate.cfm" METHOD="POST">
<INPUT TYPE="hidden" NAME="Email_required" VALUE="Please enter a valid UND.edu Email and try again.">
<INPUT TYPE="hidden" NAME="Password_required" VALUE="Please enter your password and try again.">
	
  <CFOUTPUT>
  <div class="form-group">
    <label for="inputEmail">Email Address</label>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input class="form-control"type="text" id="inputEmail" 
           placeholder="Email Address" Name="Email" VALUE="#Email#">
    </div>
  </div>
  </CFOUTPUT>

  <div class="form-group">
    <label for="inputName">Password</label>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input class="form-control" type="password" id="inputLoginPassword" 
           placeholder="Password" Name="Password">
    </div>
  </div>

  <input class="btn btn-default pull-right" type="submit" value="Login">

  <br /><br />

  <!--- <h6><a href-"#">Forget Password?</a></h6> --->
</form>


    </section>
  </div><!-- row -->   
</div><!-- content container -->

<cfinclude template="global_footer.cfm">

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>