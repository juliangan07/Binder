<style type="text/css">
body {
	background-color: #A8FFA8;
}
</style>
<cfoutput>#URL.Admin#</cfoutput>

<title>Change Admin Status | Binder</title>

<cfoutput>
<cfif #URL.Admin# EQ 'N'> 

    <CFQUERY NAME="MakeAdmin" DATASOURCE="ISBC490-SP2017">
        UPDATE USERS
        SET ADMIN='Y'
            WHERE USER_EMAIL='#URL.Email#'  
    </CFQUERY>

    <CFLOCATION URL="AdminAccountHome.cfm?Message=#URLEncodedFormat("Admin Rights for '#URL.Email#' Successfully Added!")#">
    
<cfelseif #URL.Admin# EQ 'Y'> 

    <CFQUERY NAME="RemoveAdmin" DATASOURCE="ISBC490-SP2017">
        UPDATE USERS
        SET ADMIN='N'
            WHERE USER_EMAIL='#URL.Email#'  
    </CFQUERY>

    <CFLOCATION URL="AdminAccountHome.cfm?Message=#URLEncodedFormat("Admin Rights for '#URL.Email#' Successfully Removed!")#">

</cfif>
</cfoutput>

