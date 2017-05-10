<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/styles.css">
  <link href="https://fonts.googleapis.com/css?family=Alegreya|Cabin:400,500|Catamaran:400,500|Crimson+Text:600|Harmattan|Libre+Baskerville|Noto+Serif|PT+Serif:400i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Dosis:300,400|Indie+Flower|Poppins:500|Quicksand|Raleway:500|Titillium+Web:600,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Annie+Use+Your+Telescope" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Merienda+One" rel="stylesheet">
  <title>Binder - Contact Bio</title>
</head>

<body>
<CFINCLUDE TEMPLATE="global_header.cfm">

<div class="content container">
	<div class="row">
    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
   	    	<h2>Contact Bio</h2>
    	</div>
    </div>
   	<br />
    <div class="row">
    	<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
   	    	<img class="media-object" src="images/book_1.jpg" alt="User Picture" width="200px">
    	</div>
        
        <form class="form-inline">
        	<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
        		<div class="form-group">
    				<label for="inputFirstName">First Name:</label> &nbsp;  &nbsp;  &nbsp;  &nbsp;
    				<input class="form-control"type="text" id="inputFirstName" 
           			placeholder="First Name">
  				</div>
                &nbsp;  &nbsp;  &nbsp; &nbsp;
                <div class="form-group">
    				<label for="inputLastName">Last Name:</label> &nbsp; &nbsp;
    				<input class="form-control"type="text" id="inputLastName" 
           				placeholder="Last Name">
  				</div>
                <br /> <br /> <br />
                <div class="form-group">
    			<label for="inputContactNumber">Phone Number:</label> &nbsp;
    			<input class="form-control" type="text" id="inputContactNumber" 
           		placeholder="Contact Number">
  				</div>
                &nbsp;  &nbsp;  &nbsp;
                <div class="form-group">
  					<label for="inputEmail">Email Address:</label>
  					<input  class="form-control" type="email" id="inputEmail" 
    				placeholder="Email Address">
  				</div>
        	</div>
       </form>
    </div>

	
</div>

<CFINCLUDE TEMPLATE="global_footer.cfm">

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>