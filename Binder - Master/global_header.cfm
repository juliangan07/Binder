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

<nav class="navbar navbar-default navColor" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menuCollapse">
        <span class="sr-only">Toggle Navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand titleFont" href="default.cfm">Binder</a>
    </div>
	
    <CFOUTPUT>
    <form class="navbar-form navbar-left" NAME="SearchForm" ACTION="ProductList.cfm" METHOD="POST" 
      onSubmit="return formCheck()">
          <div class="input-group">
              <input type="text" class="form-control" placeholder="Search" maxlength="255" NAME="Search">
              <div class="input-group-btn">
                <button class="btn btn-default" type="submit" NAME="Submit">
                  <i class="glyphicon glyphicon-search"></i>
                </button>
              </div>
          </div>
    </form>
	</CFOUTPUT>
    
    <div class="collapse navbar-collapse" id="menuCollapse">
      <ul class="nav navbar-nav navbar-right">
        <!--<li><a href="default.html">Home</a><li>-->
        <CFIF IsDefined("cookie.UserAccount")>
        	<li><a href="PostBook.cfm">Post a Book</a></li>
        	<li><a href="ProfileSettings.cfm">My Profile</a></li>
			<li><a href="logout.cfm" style="color:#000000" class="btn btn-default btnSignInColor">Sign Out</a></li>
        <CFELSE>
        	<li><a href="about.cfm">About</a></li>
            <li><a href="register.cfm">Register</a></li>
        	<li><a href="login.cfm" style="color:#000000" class="btn btn-default btnSignInColor">Sign In</a></li>
		</CFIF>
      </ul>
    </div>
    
  </div>
</nav>

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>