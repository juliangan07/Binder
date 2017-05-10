<style type="text/css">
body {
	background-color: #A8FFA8;
}
</style>

<title>Update Profile Process | Binder</title>

<CFQUERY NAME="UpdateRecord" DATASOURCE="ISBC490-SP2017">
	UPDATE USERS
	SET FIRST_NAME = '#Form.FirstName#',
   		LAST_NAME = '#Form.LastName#', 
    	USER_PHONE = '#Form.Phone#'
        WHERE USER_EMAIL='#URL.Email#'  
</CFQUERY>


<CFLOCATION URL="AdminAccountHome.cfm?Message=#URLEncodedFormat("Profile Successfully Updated!")#">
