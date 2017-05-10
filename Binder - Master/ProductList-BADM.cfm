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

<CFQUERY NAME="GetRecord" DATASOURCE="ISBC490-SP2017">
     SELECT Books.ISBN, Title, Author,Edition,Class_Code, PRICE, CONDITION, COMMENTS
     FROM Books, Posted
     WHERE Books.ISBN=Posted.ISBN and CLASS_CODE like 'BADM%';
</CFQUERY>

<div class="content container">
<h2>Search Result: Business Administration</h2>
  <div class="row">
    
    <!--Sort function for medium and large size-->
    <!--- <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 hidden-xs hidden-sm">
        <div class="sort">
        <h3>Sort By:</h3>
        <div class="checkbox">
          <label>
          <input id="sortPrice1" type="checkbox">
            Price</label>
        </div>
        <div class="checkbox">
          <label>
          <input id="sortCondition1" type="checkbox">
            Condition</label>
        </div>
        <div class="checkbox">
          <label>
          <input id="sortRating1" type="checkbox">
            Rating</label>
        </div>
        </div>
    </div>

    <!--Sort function for small and xs size-->
    <div class="col-xs-12 dropdown hidden-md hidden-lg form-group">
      
      <!--Sort Button-->
      <a class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
          Sort  <span class="caret"></span>
      </a>

      <!--Sort choices-->
      <ul class="dropdown-menu">
        <li>
          <div class="checkbox">
            <label>
              <input id="sortPrice2" type="checkbox" />Price
            </label>
          </div>
        </li>
        <li>
          <div class="checkbox">
            <label>
              <input id="sortCondition2" type="checkbox" />Condition
            </label>
          </div>
        </li>
        <li>
          <div class="checkbox">
            <label>
              <input id="sortRating2" type="checkbox" />Rating
            </label>
          </div>
        </li>
      </ul>

    </div> --->
    
    <cfoutput query="GetRecord">
    
    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 hidden-sm hidden-xs">
      <ul class="media list productListUL">
        <li class="media">
          <div class="media-left">
            <a href=""><img class="media-object" src="" alt="book image" width="150px"></a>
          </div>

          <div class="media-right">
            <h2 class="media-heading"><a href="">#Title#</a></h2>
            <h6>by: #Author#</h6>
            <h5>ISBN: #ISBN#</h5>
            <h5>Condition: #CONDITION#</h5>
            <h5>Comments: #COMMENTS#</h5>
            <h2 class="media-heading">$#Price#</h2>
          </div>
          
          <hr />

        </li>
      </ul>
    </div>
	
	</cfoutput>
	
    <cfoutput query="GetRecord">
    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 hidden-md hidden-lg">
          <div class="col-xs-12">
            <div class="thumbnail">
              <a href=""><img src="" alt="Book Image" width="150px"></a>
              <div class="caption text-center">
                <h2 class="media-heading breakWord"><a href="">#Title#</a></h2>
                <h6>by: #Author#</h6>
                <h5>ISBN: #ISBN#</h5>
                <h5>Condition: #CONDITION#</h5>
            	<h5>Comments: #COMMENTS#</h5>
                <h2 class="media-heading">$#PRICE#</h2>
            </div>
        </div>

        <hr />

      </div>
    </div>
    	</cfoutput>
  </div>
</div>




<cfinclude template="global_footer.cfm">

<script src="https://use.fontawesome.com/8fbc035d13.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
<body>
</body>
</html>