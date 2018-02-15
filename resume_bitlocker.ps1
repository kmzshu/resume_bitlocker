[CmdletBinding()]
Param(
[Parameter(Mandatory=$True)]
[string]$Computername
)
if(Test-Connection -ComputerName $ComputerName -Count 1 -Quiet){
    #BitLocker enable
    [wmiclass]$wmi="\\$Computername\root\cimv2:win32_process"
    $wmi.Create("manage-bde -protectors -enable c:")
    #BitLocker disable
    #$wmi.Create("manage-bde -protectors -disable c:")
}
else{
    Write-Host "Nem érhető el a hálózaton $ComputerName!" -ForegroundColor Red
}