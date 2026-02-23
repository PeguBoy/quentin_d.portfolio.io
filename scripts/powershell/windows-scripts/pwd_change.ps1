Get-LocalUser
$user = Read-Host "Username ? "
$passwd = Read-Host -AsSecureString
Get-LocalUser -Name "$user" | Set-LocalUser -Password $passwd
