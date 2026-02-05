$directory = @("$env:LOCALAPPDATA\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy", "$env:LOCALAPPDATA\Packages\Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy", "$env:LOCALAPPDATA\Microsoft\IdentityCache", "$env:LOCALAPPDATA\Microsoft\OneAuth")
$registryKeys = @("HKCU:\Software\Microsoft\Office\16.0\Common\Identity")

    foreach ($dir in $directory)
            {
                $test = Test-Path -Path $dir
                if ($test)
                {
                Remove-Item -Path $dir -Force
                Write-Host "Dossier supprimé: $dir"
                }
                else {Write-host "Dossier non présent: $dir"}
            }

    foreach ($key in $registryKeys)
            {
                $testkey = Test-Path -Path $key
                if ($testkey) 
                {
                Rename-Item -Path $key -NewName "Identity.old" -Force
                Write-Host "Clé de registre renommée en .old: $key"
                }
                else
                {
                Write-Host "Clé de registre non présente: $key"
                }
            }
        Read-host "Confirmer l'opération, relancer le serveur et reconnecter l'Office"

Remove-Item $PSCommandPath -Force

<#  liste des répertoires
%LOCALAPPDATA%\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy
%LOCALAPPDATA%\Packages\Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy
%LOCALAPPDATA%\Microsoft\IdentityCache
%LOCALAPPDATA%\Microsoft\OneAuth
HKCU:\Software\Microsoft\Office\16.0\Common\Identity
#>