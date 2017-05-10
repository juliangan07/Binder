<style type="text/css">
body {
	background-color: #A8FFA8;
}
</style>

<title>Create Post Process | Binder</title>

<cfoutput>

<CFQUERY NAME="NewMessage" DATASOURCE="ISBC490-SP2017">
INSERT INTO MESSAGES (SELLER_EMAIL, BUYER_EMAIL, POST_NUMBER, MESSAGE)
VALUES('#Form.SellerEmail#', '#Form.BuyerEmail#', '#Form.PostNumber#', '#Form.Message#')
</CFQUERY>
<CFLOCATION URL="ProfileSettings.cfm?Message=#URLEncodedFormat("Message Sent! Please wait to hear back from the seller.")#">

</cfoutput>