####list func####

$DesktopPath = [Environment]::GetFolderPath("Desktop")
function menu{
   do
    {
    $choicemenu = Read-Host "
    Quelle action à effectuer ? (Exit ou ctrl+c pour quitter)

    1) - Ouvrir dossiers fichiers temporaire
    2) - Création raccourcis
    3) - Scan système
    4) - Redémarrer le spouleur d'impression
    5) - Information/Rapport sur le poste
    
    
    q) - Quitter
    "
    }until ($choicemenu -in "1", "2", "3", "4","5","q")
    return $choicemenu
}
function makeshortcut{
$shortcut = Read-host "
    Quel raccourcis à créer ?

    1) - Shutdown
    2) - Reboot
    3) - Sleep
    4) - Logout
    "
    switch($shortcut){
    1{$SourceFilePath = "shutdown.exe"
$ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Shutdown.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$Shortcut.Arguments = "/p"
$shortcut.TargetPath = $SourceFilePath
$Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,027"
$shortcut.Save()}
    2{$SourceFilePath = "shutdown.exe"
$ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Reboot.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$Shortcut.Arguments = "/r /t 0"
$shortcut.TargetPath = $SourceFilePath
$Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,238"
$shortcut.Save()}
    3{$SourceFilePath = "rundll32.exe"
$ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Sleep.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$Shortcut.Arguments = "powrprof.dll,SetSuspendState 0,1,0"
$shortcut.TargetPath = $SourceFilePath 
$Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,025"
$shortcut.Save()}
    4{$SourceFilePath = "C:\Windows\System32\shutdown.exe /l"
$ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Logout.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,044"
$shortcut.Save()}
    }
}
#### Pas en place, a voir
function finish{
do 
    {
    $end = Read-Host "
    Tu as fini ? (O/N)
    "
    }until ($end -in "o", "n")

if ($end -eq "n")
    {menu}
elseif ($end -eq "o")
    {Write-Host "Finito pipo"
    Start-sleep -Seconds 2
    Exit}
}
function info{
    do
    {
        $choiceinfo = Read-Host "
        Quelle info ?

        a) Rapport de batterie
        b) Obtenir numéro de série


        q) Quitter
        "
        if ($choiceinfo -eq "a")
        {
        Start-Process cmd -Verb runAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList '/c powercfg /batteryreport && "%userprofile%\battery-report.html"'
        }
        elseif ($choiceinfo -eq "b")
        {
        Start-Process cmd -Verb runAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList '/c wmic bios get serialnumber && pause'
        }
        elseif ($choiceinfo -eq "q")
        {
        menu
        }
    }
    until ($choiceinfo -in "q")
    return $choiceinfo

}

#################################################################
#######################DEBUT DU SCRIPT###########################
#################################################################
<#
Write-Log -Message "Début du script"
try{
 #>
    Do{
        $menu = menu
        Switch ($menu)
        {
        1 {Write-Log -Message "Traitement en cours..." -Level INFO
           explorer.exe C:\Windows\Temp
           explorer.exe C:\Temp
           explorer.exe $env:temp}
        2 {Write-Log -Message "Traitement en cours..." -Level INFO
            makeshortcut
          }
        3 {Write-Log -Message "Traitement en cours..." -Level INFO
           $Choice2 = Read-host "
           a) sfc /scannow
           b) DISM /Online /Cleanup-image /Checkhealth
           c) DISM /Online /Cleanup-image /Scanhealth
           d) DISM /Online /Cleanup-image /Restorehealth
        "
            if ($Choice2 -eq "a")
                {Start-Process cmd.exe -Verb RunAs -Argumentlist "/c sfc /scannow"
                }
            elseif ($Choice2 -eq "b")
                {Start-Process cmd.exe -Verb RunAs -Argumentlist "/c DISM /Online /Cleanup-image /Checkhealth"
                }
            elseif ($Choice2 -eq "c")
                {Start-Process cmd.exe -Verb RunAs -Argumentlist "/c DISM /Online /Cleanup-image /Scanhealth"
                }
            elseif ($Choice2 -eq "d")
                {Start-Process cmd.exe -Verb RunAs -Argumentlist "/c DISM /Online /Cleanup-image /Restorehealth"
                }}
        4 {Write-Log -Message "Traitement en cours..." -Level INFO
          Start-Process cmd.exe -Verb RunAs -Argumentlist "/c net stop spooler && net start spooler"}
        5 {Write-Log -Message "Traitement en cours..." -Level INFO
            info
          }
        }
    }
    until($menu -eq "q")

 #   Write-Log -Message "Sortie du script en cours..." -Level INFO
<#
}

Catch{
    Write-Log -Message "Le script est planté" -Level ERROR}
finally {
    Write-Log -Message "Fin du script" -Level INFO
}
#>


#### à rajouter

<#
    $typeevent = Read-host "Quel type d'évènement ?"
    $date = Read-host "Quelle date limite ?"
    Get-WinEvent -LogName $typeevent | Where-Object { $_.LevelDisplayName -eq 'Erreur' -and 'Critique' -and $_.TimeCreated -gt '$date'}
#>