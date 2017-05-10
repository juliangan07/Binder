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
  <title>Binder - Register</title>
  
<SCRIPT LANGUAGE="JavaScript">
function formCheck() 
{
  if (document.PortalRegistration.Email.value != 
    document.PortalRegistration.Email2.value) {
      alert("The Email Addresses you entered do not match.  Please try again.");
      document.PortalRegistration.Email.value = '';
      document.PortalRegistration.Email2.value = '';
      return false;
 }
 
  if (document.PortalRegistration.Email.value == "" ||
    document.PortalRegistration.Email2.value == "") {
      alert("You can not leave either email field blank.");
      return false;      
  }

  if (document.PortalRegistration.Password.value != 
    document.PortalRegistration.Password2.value) {
      alert("The passwords you entered do not match.  Please reenter them.");
      document.PortalRegistration.Password.value = '';
      document.PortalRegistration.Password2.value = '';
      return false;
  }
  
  if (document.PortalRegistration.Password.value == "" ||
    document.PortalRegistration.Password2.value == "") {
      alert("You can not leave either password field blank.");
      return false;      
  }
}
</SCRIPT>  
</head>
<body>
<cfinclude template="global_header.cfm">

<div class="content container">
  <div class="row">


<div class="container">

  <h2>Register</h2>

  <h6>Please register using your UND.edu email address</h6>

  <div class="row">
    <section class="col-xs-12">

<CFIF IsDefined('URL.Message')>
  <CFOUTPUT>
    <FONT COLOR="Red">#URL.Message#</FONT>
</CFOUTPUT>
<P>
</CFIF>

<form Name="PortalRegistration" ACTION="registrationProcess.cfm" METHOD="POST" onSubmit="return formCheck()">
<INPUT TYPE="hidden" NAME="Email_required" VALUE="Please enter a valid UND.edu email address and try again.">
<INPUT TYPE="hidden" NAME="Password_required" VALUE="Please enter a password and try again.">
<INPUT TYPE="hidden" NAME="FirstName_required" VALUE="You must supply your First Name">
<INPUT TYPE="hidden" NAME="LastName_required" VALUE="You must supply your Last Name">
<INPUT TYPE="hidden" NAME="Phone_required" VALUE="You must supply your phone number">

  <div class="form-group">
    <label class="control-label" for="inputLoginEmail">Email Address</label>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input class="form-control" type="text" id="inputLoginEmail" 
           placeholder="Email Address" Name="Email" maxlength="50">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label" for="inputLoginEmailConfirm">Confirm Email Address</label>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input class="form-control"type="text" id="inputLoginEmailConfirm" 
           placeholder="Email Address" Name="Email2" maxlength="50">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label" for="inputFirstName">First Name</label>
    <div class="input-group">
      <span class="input-group-addon"><img src="./images/nameplate.png" aria-hidden="true" width="14px"/></span>
      <input class="form-control" type="text" id="inputFirstName" 
           placeholder="First Name" Name="FirstName" maxlength="50">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label" for="inputLastName">Last Name</label>
    <div class="input-group">
      <span class="input-group-addon"><img src="./images/nameplate.png" aria-hidden="true" width="14px"/></span>
      <input class="form-control" type="text" id="inputLastName" 
           placeholder="Last Name" Name="LastName" maxlength="50">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label" for="inputPhone">Phone Number</label>
    <div class="input-group">
      <span class="input-group-addon"><img src="./images/iphone.png" aria-hidden="true" width="11px"/></span>
      <input class="form-control" type="text" id="inputPhone" 
           placeholder="Phone Number" Name="Phone" maxlength="10">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label" for="inputLoginPassword">Password</label>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input class="form-control" type="password" id="inputLoginPassword" 
           placeholder="Password" Name="Password" maxlength="50">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label" for="inputLoginPasswordConfirm">Confirm Password</label>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input class="form-control" type="password" id="inputLoginPasswordConfirm" 
           placeholder="Password" Name="Password2" maxlength="50">
    </div>
  </div>

  <input class="btn btn-default pull-right" type="submit" value="Register">

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