﻿$ip = '10.0.0.128'

$cred = Get-Credential -Credential $ip\administrator

set-item WSMan:\localhost\Client\TrustedHosts $ip -Concatenate

Enter-PSSession -ComputerName $ip -Credential $cred

# Enabling fil copy to Nano

netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=yes

# Enabling CredSSP for Nano to do Live Migration and VMs over SMB

Enable-WSManCredSSP -Role Server