<style type="text/css">
body {
	background-color: #A8FFA8;
}
</style>
<cfoutput>#URL.Active#</cfoutput>

<title>Activate Account | Binder</title>

<cfoutput>
<cfif #URL.Active# EQ 'N'> 

    <CFQUERY NAME="ActivateAccount" DATASOURCE="ISBC490-SP2017">
        UPDATE USERS
        SET ACTIVE='Y'
            WHERE USER_EMAIL='#URL.Email#'  
    </CFQUERY>

    <CFLOCATION URL="AdminAccountHome.cfm?Message=#URLEncodedFormat("Profile '#URL.Email#' Successfully Activated!")#">
    
<cfelseif #URL.Active# EQ 'Y'> 

    <CFQUERY NAME="ActivateAccount" DATASOURCE="ISBC490-SP2017">
        UPDATE USERS
        SET ACTIVE='N'
            WHERE USER_EMAIL='#URL.Email#'  
    </CFQUERY>

    <CFLOCATION URL="AdminAccountHome.cfm?Message=#URLEncodedFormat("Profile '#URL.Email#' Successfully Deactivated!")#">
<!---
<cfelse>
<CFLOCATION URL="AdminAccountHome.cfm?Message=#URLEncodedFormat("No action was taken.")#">--->

</cfif>
</cfoutput>

