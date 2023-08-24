# Import the ExchangeOnlineManagement module
Import-Module -Name ExchangeOnlineManagement -RequiredVersion 3.0.0

# Login as admin
$input1 = Read-Host "Enter Admin Email"
Connect-ExchangeOnline -UserPrincipalName $input1

# Output all email addresses
Write-Host "Here is all the Emails ⬇️"

$mailboxes = Get-Mailbox
$mailboxes | ForEach-Object {
    $_.PrimarySmtpAddress
}

# Share out calendar
Write-Host "Share out calendar ⬇️"

$email_s = Read-Host "Share from Email"
$email_ss = Read-Host "Share to Email"
Set-MailboxFolderPermission -Identity "${email_s}:\Calendar" -User $email_ss -AccessRights Editor

#output the permisison 
Get-MailboxFolderPermission -Identity "${email_s}:\Calendar" -User $email_ss
