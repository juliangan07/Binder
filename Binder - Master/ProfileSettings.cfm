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
  
  <CFQUERY NAME="CurrentAccount" DATASOURCE="ISBC490-SP2017">
        SELECT FIRST_NAME, LAST_NAME, USER_PHONE, USER_EMAIL
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
    
</head>
<body>
<cfinclude template="global_header.cfm">

<CFOUTPUT QUERY="CurrentAccount">
<div class="container">
    <h2>User Profile</h2>
    <br />
    <div class="row">
    	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
    	<p><img name="" src="" width="185" height="128" alt="" /></p>
    </div>
   
   <form id="form1" name="form1" method="post" action="EditProfileProcess.cfm" class="form-inline">
   <cfif isdefined("form.SaveChanges")>
   <INPUT TYPE="hidden" NAME="FirstName_Required" VALUE="First Name is a required field">
	<INPUT TYPE="hidden" NAME="LastName_Required" VALUE="Last Name is a required field">
	<INPUT TYPE="hidden" NAME="Phone_Required" VALUE="Phone is a required field">
    </cfif>
    
   <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
    	<div class="form-group">
  			<label for="inputEmail">Email Address:</label> &nbsp;&nbsp;
  			<input  class="form-control" type="email" id="inputEmail" 
    		placeholder="Email Address" value="#USER_EMAIL#" readonly>
  		</div>
        
        <div class="form-group">
    		<label for="inputContactNumber">Phone Number:</label> &nbsp;
    		<input class="form-control" type="text" id="inputContactNumber" name="Phone"  
        	placeholder="Contact Number" value="#USER_PHONE#" maxlength="10">
  		</div>
        
        <br /><br />
       
        <CFIF IsDefined('URL.Message')>
        <CFOUTPUT>
          <FONT COLOR="Red">#URL.Message#</FONT>
        </CFOUTPUT>
        <P>
      	</CFIF>
    </div>
   
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="form-group">
        <label for="inputFirstName">First Name:</label> &nbsp; 
        <input class="form-control"type="text" id="inputFirstName" name="FirstName"
        placeholder="First Name" value="#FIRST_NAME#">
    	</div>
      
       <div class="form-group">
        <label for="inputLastName">Last Name:</label> &nbsp; 
        <input class="form-control"type="text" id="inputLastName"  Name="LastName"
        placeholder="Last Name" value="#LAST_NAME#">
  	   </div>
       
       <br /><br />
       <input class="btn btn-default" type="submit" value="Save Changes" name="SaveChanges" id="SaveChanges">
       <br /><br />
       
    </div>
    

    </div>
</CFOUTPUT>
	
	<cfif isdefined("form.ChangePassword")>
    <form id="form2" name="form2" method="post" action="EditProfileProcess.cfm" class="form-inline">
    <INPUT TYPE="hidden" NAME="NewPassword_Required" VALUE="Password is a required field">
    </cfif>
    
    <div class="container">
    	<div class="row">
        	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            	<h2>Change Password</h2>
        		<br />
            	  <div class="form-group">
    				<label for="inputNewPassword">New Password:</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    				<div class="input-group">
      				<input class="form-control" type="password" id="inputNewPassword" 
           			placeholder="New Password" Name="NewPassword">
    				</div>
            	  </div>
                  
                  <div class="form-group">
    				<label for="inputConfirmPassword">Confirm Password:</label> &nbsp;
    				<div class="input-group">
      				<input class="form-control" type="password" id="inputConfirmPassword" 
           			placeholder="Confirm Password" Name="Password2">
    				</div>
            	  </div>
                  <br />
                  <input class="btn btn-default" type="submit" value="Change Password" name="ChangePassword" id="ChangePassword">
                  
            <br /><br />    
        	</div>
            
            </form>
            
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
            	<h2>Here are all the books you have posted.</h2>
                <div class="table-responsive">
                <table class="table">
                    <thead>
                      <tr>
                        <th>Post Number</th>
                        <th>Class Code</th>
                        <th>ISBN</th>
                        <th>Title</th>
                        <th>Price</th>
                        <th>Condition</th>
                        <th></th>
                        <th></th>
                      </tr>
                    </thead>
                    <CFOUTPUT Query="GetPosts">
                    <tbody>
                      <tr>
                        <TD>#POST_NUMBER#</TD>
                        <TD>#CLASS_CODE#</TD>
                        <TD>#ISBN#</TD>                  
                        <TD>#TITLE#</TD>                 
                        <TD>$#PRICE#</TD>                 
                        <TD>#CONDITION#</TD>
                        <TD><A HREF="PostBook.cfm?Edit=#POST_NUMBER#&Class=#CLASS_CODE#">EDIT</A></TD>
						<TD><A HREF="PostDeleteProcess.cfm?PostNo=#POST_NUMBER#&Action=Delete">DELETE</A></TD>  
                      </tr>
                    </tbody>
                    </CFOUTPUT>
                  </table>
                  </div>
            </div>
            
            <!---
            <form class="form-inline" name="form3" method="POST">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            	<h2>Email Subscription Setting</h2>
                <br />
                
                <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                	<div class="dropdown">
                      <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Department
                      <span class="caret"></span></button>
                      <ul class="dropdown-menu">
                        <li><input type="checkbox" name="Department" value="ISBC">ISBC</li>
                        <li><input type="checkbox" name="Department" value="POLS">POLS</li>
                        <li><input type="checkbox" name="Department" value="MRKT">MRKT</li>
                        <li><input type="checkbox" name="Department" value="ACCT">ACCT</li>
                        <li><input type="checkbox" name="Department" value="MGMT">MGMT</li>
                        <li><input type="checkbox" name="Department" value="ECON">ECON</li>
                        <li><input type="checkbox" name="Department" value="BADM">BADM</li>
                        <li><input type="checkbox" name="Department" value="FIN">FIN</li>
                        <li><input type="checkbox" name="Department" value="ENTR">ENTR</li>
                      </ul>
					</div>
                </div>
                
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                	<div class="dropdown">
                      <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Class
                      <span class="caret"></span></button>
                      <ul class="dropdown-menu">
                        <li><input type="checkbox" name="Class" value="">Class1</li>
                        <li><input type="checkbox" name="Class" value="">Class2</li>
                        <li><input type="checkbox" name="Class" value="">Class3</li>
                        <li><input type="checkbox" name="Class" value="">Class4</li>
                        <li><input type="checkbox" name="Class" value="">Class5</li>
                        <li><input type="checkbox" name="Class" value="">Class6</li>
                        <li><input type="checkbox" name="Class" value="">Class7</li>
                        <li><input type="checkbox" name="Class" value="">Class8</li>
                        <li><input type="checkbox" name="Class" value="">Class9</li>
                  	  </ul>
				   </div>
                </div>
                
                
                </div>
                
                <BR />
                
                <div class="radio">
  				<label><input type="radio" name="rbtnSubscription">&nbsp; I would like to recieve emails to alert me for the following:</label>
                
                <BR /><BR />
                <input class="btn btn-default" type="submit" value="Subscribe" name="Subscibe" id="Subscibe">
				</div>
            </div>
         </div>  

    </form>
	--->
</div>

<br /> <br /><br /> 
<cfinclude template="global_footer.cfm">

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
<body>
</body>
</html>