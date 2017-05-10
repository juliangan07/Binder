<style type="text/css">

body {

	background-color: #A8FFA8;

}

</style>



<title>Create Post Process | Binder</title>

<cfoutput>

<cfif IsDefined('URL.PostNo')>

<CFQUERY NAME="EditPost" DATASOURCE="ISBC490-SP2017">

         UPDATE POSTED

         SET ISBN='#Form.Book#',

        	 PRICE='#Form.Price#',

             CONDITION='#Form.Condition#',

             COMMENTS='#Form.Comments#'

         WHERE POST_NUMBER='#URL.PostNo#'

</CFQUERY>

<CFLOCATION URL="ReviewPost.cfm?Updated=#URL.PostNo#&Message=#URLEncodedFormat("Post #URL.PostNo# Updated! Below you will find the details for your post.")#">



<cfelse>



<CFQUERY NAME="NewPost" DATASOURCE="ISBC490-SP2017">

         INSERT INTO POSTED(ISBN, USER_EMAIL, PRICE, CONDITION, COMMENTS)

         VALUES('#Form.Book#', '#cookie.UserAccount#', '#Form.Price#', '#Form.Condition#', '#Form.Comments#')

</CFQUERY>

<CFLOCATION URL="ReviewPost.cfm?Message=#URLEncodedFormat("Post Created! Below you will find the details for your post.")#">



</cfif>

</cfoutput>

