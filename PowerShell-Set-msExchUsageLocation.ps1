#The script will set the msExchUsageLocation based on the Country by OU
#The msExchUsageLocation is used in the Azure AD to set the Usage Location
#Please insert -SearchBase ""
$adusers = get-aduser -Properties * -SearchBase "" -Filter *
foreach($aduser in $adusers) {
	$location = $aduser.c
	set-ADUser -Identity $aduser -Replace @{msExchUsageLocation = $location}
}