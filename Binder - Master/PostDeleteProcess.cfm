<cfoutput>
<CFQUERY NAME="UserStatus" DATASOURCE="ISBC490-SP2017">
         SELECT USER_EMAIL, ADMIN
         FROM USERS
         WHERE USER_EMAIL=<cfqueryparam value="#cookie.UserAccount#">
</CFQUERY>

<CFIF (IsDefined('URL.Action') AND URL.Action EQ "Delete")>
  <CFQUERY NAME="PostInfo" DATASOURCE="ISBC490-SP2017">
        SELECT POST_NUMBER, POSTED.ISBN, TITLE, PRICE, CONDITION, COMMENTS, CLASS_CODE
        FROM POSTED, BOOKS
        WHERE POSTED.ISBN=BOOKS.ISBN
        AND POST_NUMBER='#URL.PostNo#'
  </CFQUERY>
  <CFQUERY NAME="DeletePost" DATASOURCE="ISBC490-SP2017">
           DELETE FROM POSTED
         WHERE POST_NUMBER='#URL.PostNo#'
  </CFQUERY>
</CFIF>

<cfif #UserStatus.ADMIN# EQ 'Y' and IsDefined("URL.AllPosts")>
	  <CFLOCATION URL="ViewAllPosts.cfm?Message=#URLEncodedFormat("Your post for #PostInfo.TITLE# has been successfully deleted.")#">
      <cfelseif #UserStatus.ADMIN# EQ 'Y'>
	  <CFLOCATION URL="AdminAccountHome.cfm?Message=#URLEncodedFormat("Your post for #PostInfo.TITLE# has been successfully deleted.")#">
    <cfelseif #UserStatus.ADMIN# EQ 'N'>
  <CFLOCATION URL="ProfileSettings.cfm?Message=#URLEncodedFormat("Your post for #PostInfo.TITLE# has been successfully deleted.")#">
	<cfelse>
    	THERE HAS BEEN AN ERROR. CLICK THE BACK BUTTON ON YOUR BROWSER.
</cfif>

<title>Logout | Binder</title>

</cfoutput>