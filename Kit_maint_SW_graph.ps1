#### Chargement Windows Forms ####
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$quitbackcolor = 'LightSalmon'
$textwhite = [System.Drawing.Color]::White
$textblack = [System.Drawing.Color]::Black
$backred = [System.Drawing.Color]::Darkred
$boldbutton = New-Object System.Drawing.Font("Arial", 10,[System.Drawing.FontStyle]::Bold)

#### Fonction secondaire ####
function makeshortcut{

            $form3 = New-Object System.Windows.Forms.Form
            $form3.Text = ""
            $form3.Size = New-Object System.Drawing.Size(200, 300)
            $form3.StartPosition = "CenterScreen"
            $form3.BackColor = $backred
            $form3.ForeColor = $textwhite

            $buttona = New-Object System.Windows.Forms.Button
            $buttona.Text = "Icone eteindre"
            $buttona.Location = New-Object System.Drawing.Point(15, 10)
            $buttona.Size = New-Object System.Drawing.Size(150, 30)
            $buttona.Add_Click(
                {
                    $SourceFilePath = "shutdown.exe"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\eteindre.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $Shortcut.Arguments = "/p"
                    $shortcut.TargetPath = $SourceFilePath
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,027"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttona)    

            $buttonb = New-Object System.Windows.Forms.Button
            $buttonb.Text = "Icone redemarrage"
            $buttonb.Location = New-Object System.Drawing.Point(15, 50)
            $buttonb.Size = New-Object System.Drawing.Size(150, 30)
            $buttonb.Add_Click(
                {
                    $SourceFilePath = "shutdown.exe"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Redemarrage.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $Shortcut.Arguments = "/r /t 0"
                    $shortcut.TargetPath = $SourceFilePath
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,238"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttonb) 
            
            $buttonc = New-Object System.Windows.Forms.Button
            $buttonc.Text = "Icone veille"
            $buttonc.Location = New-Object System.Drawing.Point(15, 90)
            $buttonc.Size = New-Object System.Drawing.Size(150, 30)
            $buttonc.Add_Click(
                {
                    $SourceFilePath = "rundll32.exe"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Veille.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $Shortcut.Arguments = "powrprof.dll,SetSuspendState 0,1,0"
                    $shortcut.TargetPath = $SourceFilePath 
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,025"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttonc)
            
            $buttond = New-Object System.Windows.Forms.Button
            $buttond.Text = "Icone deconnexion"
            $buttond.Location = New-Object System.Drawing.Point(15, 130)
            $buttond.Size = New-Object System.Drawing.Size(150, 30)
            $buttond.Add_Click(
                {
                    $SourceFilePath = "C:\Windows\System32\shutdown.exe /l"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Deconnexion.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $shortcut.TargetPath = $SourceFilePath
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,044"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttond)

            $buttonquit = New-Object System.Windows.Forms.Button
            $buttonquit.Text = "Quitter"
            $buttonquit.Location = New-Object System.Drawing.Point(15, 200)
            $buttonquit.Size = New-Object System.Drawing.Size(150, 30)
            $buttonquit.Font = $boldbutton
            $buttonquit.BackColor = $quitbackcolor
            $buttonquit.ForeColor = $textblack
            $buttonquit.Add_Click({
                $form3.Close()
            })
            $form3.Controls.Add($buttonquit)

            $form3.Add_Shown({ $form3.Activate() })
            [void]$form3.ShowDialog()
}
function scan{    

            $form2 = New-Object System.Windows.Forms.Form
            $form2.Text = "Menu des scans"
            $form2.Size = New-Object System.Drawing.Size(300, 270)
            $form2.StartPosition = "CenterScreen"
            $form2.BackColor = $backred
            $form2.ForeColor = $textwhite
           
            $buttona = New-Object System.Windows.Forms.Button
            $buttona.Text = "sfc /scannow"
            $buttona.Location = New-Object System.Drawing.Point(10, 10)
            $buttona.Size = New-Object System.Drawing.Size(250, 30)
            $buttona.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c sfc /scannow && pause"
                })
                $form2.Controls.Add($buttona)

            $form2.Controls.Add($label)
            $buttonb = New-Object System.Windows.Forms.Button
            $buttonb.Text = "DISM /Online /Cleanup-image /Scanhealth"
            $buttonb.Location = New-Object System.Drawing.Point(10, 50)
            $buttonb.Size = New-Object System.Drawing.Size(250, 30)
            $buttonb.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c DISM /Online /Cleanup-image /Scanhealth && pause"
                })
                $form2.Controls.Add($buttonb)

            $form2.Controls.Add($label)
            $buttond = New-Object System.Windows.Forms.Button
            $buttond.Text = "DISM /Online /Cleanup-image /Restorehealth"
            $buttond.Location = New-Object System.Drawing.Point(10, 90)
            $buttond.Size = New-Object System.Drawing.Size(250, 30)
            $buttond.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c DISM /Online /Cleanup-image /Restorehealth && pause"
                })
                $form2.Controls.Add($buttond)

            $buttone = New-Object System.Windows.Forms.Button 
            $buttone.Font = New-Object System.Drawing.Font("Lucia console",10,[System.Drawing.FontStyle]::Bold)
            $buttone.Text = "Personnaliser DISM"
            $buttone.Location = New-Object System.Drawing.Point(10, 150)
            $buttone.Size = New-Object System.Drawing.Size(250, 30)
            $buttone.Add_Click({

#### Fenetre de selection du DISM ####

                    $form21 = New-Object System.Windows.Forms.Form
                    $form21.Text = "Personnaliser DISM"
                    $form21.Size = New-Object System.Drawing.Size(1200, 650)
                    $form21.StartPosition = "CenterScreen"
                    $form21.BackColor = $backred
                    $form21.ForeColor = $textwhite

                    $okButton = New-Object System.Windows.Forms.Button
                    $okButton.Location = New-Object System.Drawing.Point(110,100)
                    $okButton.Size = New-Object System.Drawing.Size(75,23)
                    $okButton.Text = 'OK'
                    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
                    $form21.AcceptButton = $okButton
                    $form21.Controls.Add($okButton)

                    $cancelButton = New-Object System.Windows.Forms.Button
                    $cancelButton.Location = New-Object System.Drawing.Point(205,100)
                    $cancelButton.Size = New-Object System.Drawing.Size(75,23)
                    $cancelButton.Text = 'Cancel'
                    $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
                    $cancelButton.Font = $boldbutton
                    $cancelButton.BackColor = $quitbackcolor
                    $cancelButton.ForeColor = $textblack
                    $form21.CancelButton = $cancelButton
                    $form21.Controls.Add($cancelButton)

                                        $listdism = dism.exe /? | Out-String
                                        $Textboxdism = New-Object System.Windows.Forms.Textbox
                                        $Textboxdism.Location = New-Object System.Drawing.Point(500,20)
                                        $Textboxdism.Size = New-Object System.Drawing.Size(650, 550)
                                        $Textboxdism.Multiline = $true
                                        $Textboxdism.WordWrap = $false
                                        $Textboxdism.ScrollBars = [System.Windows.Forms.ScrollBars]::Both
                                        $Textboxdism.ReadOnly = $true
                                        $Textboxdism.Font = New-Object System.Drawing.Font("Consolas",10)
                                        $Textboxdism.Text = $listdism
                                        $form21.Controls.Add($Textboxdism)

                    $labelapp = New-Object System.Windows.Forms.Label
                    $labelapp.Location = New-Object System.Drawing.Point(10,20)
                    $labelapp.Size = New-Object System.Drawing.Size(250,20)
                    $labelapp.Text = 'Entrer votre ligne de commande (libre) :'
                    $form21.Controls.Add($labelapp)
                        
                            $textbox = New-Object System.Windows.Forms.textbox
                            $textbox.Location = New-Object System.Drawing.Point(10,60)
                            $textbox.Size = New-Object System.Drawing.Size(460,20)
                            $form21.Controls.Add($textbox)
                    
                    $form21.Add_Shown({$textbox.Select()})
                    $result = $form21.ShowDialog()

                    if ($result -eq [System.Windows.Forms.DialogResult]::OK)
                    {
                        $actioncmd = $textBox.Text
                        Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c", "$actioncmd && pause"
                    }
                })

            $form2.Controls.Add($buttone)

            $buttonquit = New-Object System.Windows.Forms.Button
            $buttonquit.Text = "Quitter"
            $buttonquit.Location = New-Object System.Drawing.Point(10, 190)
            $buttonquit.Size = New-Object System.Drawing.Size(250, 30)
            $buttonquit.Font = $boldbutton
            $buttonquit.BackColor = $quitbackcolor
            $buttonquit.ForeColor = $textblack
            $buttonquit.Add_Click({
                $form2.Close()
            })
            $form2.Controls.Add($buttonquit)

            $form2.Add_Shown({ $form2.Activate() })
            [void]$form2.ShowDialog()
}
function killapp{

            $form4 = New-Object System.Windows.Forms.Form
            $form4.Text = "Liste des applications"
            $form4.Size = New-Object System.Drawing.Size(380,250)
            $form4.StartPosition = "CenterScreen"
            $form4.BackColor = $backred
            $form4.ForeColor = $textwhite
            
            $okButton = New-Object System.Windows.Forms.Button
            $okButton.Location = New-Object System.Drawing.Point(100,160)
            $okButton.Size = New-Object System.Drawing.Size(75,23)
            $okButton.Text = 'OK'
            $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
            $form4.AcceptButton = $okButton
            $form4.Controls.Add($okButton)

            $cancelButton = New-Object System.Windows.Forms.Button
            $cancelButton.Location = New-Object System.Drawing.Point(195,160)
            $cancelButton.Size = New-Object System.Drawing.Size(75,23)
            $cancelButton.Text = 'Cancel'
            $cancelButton.Font = $boldbutton
            $cancelButton.BackColor = $quitbackcolor
            $form4.CancelButton = $cancelButton
            $form4.Controls.Add($cancelButton)

#### Relance app en route ####

            $labelapp = New-Object System.Windows.Forms.Label
            $labelapp.Location = New-Object System.Drawing.Point(10,20)
            $labelapp.Size = New-Object System.Drawing.Size(280,20)
            $labelapp.Text = 'Selectionner une application (Active)'
            $form4.Controls.Add($labelapp)

            $ComboBox = New-Object System.Windows.Forms.ComboBox
            $ComboBox.Location = New-Object System.Drawing.Point(10,50)
            $ComboBox.Size = New-Object System.Drawing.Size(340,400)
            $ComboBox.Height = 100
            $listapp = @(Get-Process | Where-Object {$_.MainWindowTitle} | Select-Object Name, Description | Group-Object Name | Foreach-Object {$_.Group | Select-Object -First 1})
            $ComboBox.DataSource = $listapp | Foreach-Object {"$($_.Name)-$($_.Description)"}

#### Relance app plante ####

            $labelapp2 = New-Object System.Windows.Forms.Label
            $labelapp2.Location = New-Object System.Drawing.Point(10,90)
            $labelapp2.Size = New-Object System.Drawing.Size(280,20)
            $labelapp2.Text = 'Selectionner une application (Plante)'
            $form4.Controls.Add($labelapp2)

            $ComboBox2 = New-Object System.Windows.Forms.ComboBox
            $ComboBox2.Location = New-Object System.Drawing.Point(10,120)
            $ComboBox2.Size = New-Object System.Drawing.Size(340,400)
            $ComboBox2.Height = 100
            $noresponding = @(Get-Process | Where-Object {$_.Responding -eq $false} | Select-Object Name, Description | Group-Object Name | Foreach-Object {$_.Group | Select-Object -First 1})
            $ComboBox2.DataSource = $noresponding | Foreach-Object {"$($_.Name)-$($_.Description)"} -ErrorAction SilentlyContinue
            
            $form4.Controls.Add($ComboBox)
            $form4.Controls.Add($ComboBox2)
            $form4.Topmost = $true
            $result = $form4.ShowDialog()

            if ($result -eq [System.Windows.Forms.DialogResult]::OK)
            {
                $app = $ComboBox.Text
                Stop-Process -Name $app.Split("-")[0]
                Start-Process $app.Split("-")[0]
            }

            if ($result -eq [System.Windows.Forms.DialogResult]::OK)
            {
                $app2 = $ComboBox2.Text
                Stop-Process -Name $app2.Split("-")[0]
                Start-Process $app2.Split("-")[0]
            }

}
function wintools{

    $form71 = New-Object System.Windows.Forms.Form
    $form71.Text = "Outils Windows"
    $form71.Size = New-Object System.Drawing.Size(600, 440)
    $form71.StartPosition = "CenterScreen"
    $form71.BackColor = $backred
    $form71.ForeColor = $textwhite


    $labelconfig = New-Object System.Windows.Forms.Label
    $labelconfig.Location = New-Object System.Drawing.Point(10,20)
    $labelconfig.font = $boldbutton
    $labelconfig.Size = New-Object System.Drawing.Size(120,20)
    $labelconfig.Text = "Configuration :"
    $form71.Controls.Add($labelconfig)

    $labelrapp = New-Object System.Windows.Forms.Label
    $labelrapp.Location = New-Object System.Drawing.Point(200,20)
    $labelrapp.font = $boldbutton
    $labelrapp.Size = New-Object System.Drawing.Size(120,20)
    $labelrapp.Text = "Rapports :"
    $form71.Controls.Add($labelrapp)

    $labelsvc = New-Object System.Windows.Forms.Label
    $labelsvc.Location = New-Object System.Drawing.Point(390,20)
    $labelsvc.font = $boldbutton
    $labelsvc.Size = New-Object System.Drawing.Size(120,20)
    $labelsvc.Text = "Services :"
    $form71.Controls.Add($labelsvc)

#### Ouverture dossier fichiers temp ####

    $button71 = New-Object System.Windows.Forms.Button
    $button71.Text = "Ouvrir dossiers temps"
    $button71.Location = New-Object System.Drawing.Point(10, 50)
    $button71.Size = New-Object System.Drawing.Size(175, 30)
    $button71.Add_Click({
    $pathstemp = @("C:\Windows\Temp", "C:\Temp", $env:temp)
    $pathstemp | foreach-object {if (Test-path $_) {Invoke-item $_}}
    })

    $form71.Controls.Add($button71)

#### Filtrer des events ####

    $button72 = New-Object System.Windows.Forms.Button
    $button72.Text = "Obs d'event"
    $button72.Location = New-Object System.Drawing.Point(200, 50)
    $button72.Size = New-Object System.Drawing.Size(175, 30)
    $button72.Add_Click({

        $form72 = New-Object System.Windows.Forms.Form
        $form72.Text = "Filtrage des elements"
        $form72.Size = New-Object System.Drawing.Size(400, 450)
        $form72.BackColor = $backred
        $form72.StartPosition = "CenterScreen"

        $okButton = New-Object System.Windows.Forms.Button
        $okButton.Location = New-Object System.Drawing.Point(100,370)
        $okButton.Size = New-Object System.Drawing.Size(75,23)
        $okButton.Text = 'Chercher'
        $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $form72.AcceptButton = $okButton
        $form72.Controls.Add($okButton)

        $buttonquit = New-Object System.Windows.Forms.Button
        $buttonquit.Text = "Quitter"
        $buttonquit.Location = New-Object System.Drawing.Point(192, 370)
        $buttonquit.Size = New-Object System.Drawing.Size(75, 23)
        $buttonquit.Font = $boldbutton
        $buttonquit.BackColor = $quitbackcolor
        $buttonquit.ForeColor = $textblack
        $buttonquit.Add_Click({
            $form72.Close()
        })
        $form72.Controls.Add($buttonquit)

                    $labeltype = New-Object System.Windows.Forms.Label
                    $labeltype.Location = New-Object System.Drawing.Point(20,20)
                    $labeltype.Size = New-Object System.Drawing.Size(150,30)
                    $labeltype.Text = "Quel type d'evenement ?"
                    $form72.Controls.Add($labeltype)

                            $typebox = New-Object System.Windows.Forms.combobox
                            $typebox.Location = New-Object System.Drawing.Point(30,50)
                            $typebox.Size = New-Object System.Drawing.Size(110,50)
                            $typebox.DataSource = 'Application', 'Security', 'Installation', 'System'
                            $form72.Controls.Add($typebox)

                    $labellvl = New-Object System.Windows.Forms.Label
                    $labellvl.Location = New-Object System.Drawing.Point(200,20)
                    $labellvl.Size = New-Object System.Drawing.Size(150,30)
                    $labellvl.Text = "Quel niveau d'erreur ?"
                    $form72.Controls.Add($labellvl)
                        
                            $lvlbox = New-Object System.Windows.Forms.combobox
                            $lvlbox.Location = New-Object System.Drawing.Point(200,50)
                            $lvlbox.Size = New-Object System.Drawing.Size(110,50)
                            $lvlbox.DataSource = 'Erreur', 'Critique', 'Avertissement', 'Information'
                            $form72.Controls.Add($lvlbox)

                    $buttoncalendar = New-Object System.Windows.Forms.Button
                    $buttoncalendar.Location = New-Object System.Drawing.Point(30, 90)
                    $buttoncalendar.Size = New-Object System.Drawing.Size(110, 40)
                    $buttoncalendar.Text = "Date de début ? (par défaut ce jour)"
                    $buttoncalendar.Add_Click({
                        $datePickerstart.Visible = -not $datePickerstart.Visible
                    })
                    $form72.Controls.Add($buttoncalendar)

                            $selectedDatestart = New-Object System.Windows.Forms.textbox
                            $selectedDatestart.Size = New-Object System.Drawing.Size(110, 25)
                            $selectedDatestart.Location = New-Object System.Drawing.Point(30, 140)
                            $form72.Controls.Add($selectedDatestart)
          
                            $datePickerstart = New-Object System.Windows.Forms.MonthCalendar
                            $datePickerstart.Location = New-Object System.Drawing.Point(80, 180)
                            $datePickerstart.MaxSelectionCount = 1
                            $datePickerstart.Visible = $false
                            $form72.Controls.Add($datePickerstart)

                            $datePickerstart.Add_DateSelected({
                                $selectedDate = $datePickerstart.SelectionStart.ToShortDateString()
                                $selectedDatestart.Text = $selectedDate
                                $datePickerstart.Visible = $false
                            })

                    $buttoncalendarend = New-Object System.Windows.Forms.Button
                    $buttoncalendarend.Location = New-Object System.Drawing.Point(200, 90)
                    $buttoncalendarend.Size = New-Object System.Drawing.Size(110, 40)
                    $buttoncalendarend.Text = "Date de fin ?"
                    $buttoncalendarend.Add_Click({
                        $datePickerend.Visible = -not $datePickerend.Visible
                    })
                    $form72.Controls.Add($buttoncalendarend)

                            $selectedDateend = New-Object System.Windows.Forms.textbox
                            $selectedDateend.Size = New-Object System.Drawing.Size(110, 25)
                            $selectedDateend.Location = New-Object System.Drawing.Point(200, 140)
                            $form72.Controls.Add($selectedDateend)

                            $datePickerend = New-Object System.Windows.Forms.MonthCalendar
                            $datePickerend.Location = New-Object System.Drawing.Point(80, 180)
                            $datePickerend.MaxSelectionCount = 1
                            $datePickerend.Visible = $false
                            $form72.Controls.Add($datePickerend)

                            $datePickerend.Add_DateSelected({
                                $selectedDate = $datePickerend.SelectionStart.ToShortDateString()
                                $selectedDateend.Text = $selectedDate
                                $datePickerend.Visible = $false
                            })            

                    $form72.Add_Shown({$typebox.Select()})
                    $resultevent = $form72.ShowDialog()

        if ($resultevent -eq [System.Windows.Forms.DialogResult]::OK)
                {
                    $typeevent = $typebox.Text
                    $lvl = $lvlbox.Text

                if  ($selectedDatestart.text -eq $null -or $selectedDatestart.Text -eq "")
                    {
                    $datestart = Get-Date -Format "dd/MM/yyyy"
                    }
                else{
                    $datestart = [datetime]::ParseExact($selectedDatestart.Text, "dd/MM/yyyy", $null)
                    }
                    $dateend = [datetime]::ParseExact($selectedDateend.Text, "dd/MM/yyyy", $null)

                    $eventout = Get-WinEvent -LogName $typeevent | Where-Object {($_.LevelDisplayName -eq $lvl) -and ($_.TimeCreated -lt $datestart) -and ($_.TimeCreated -gt $dateend)} | Select-Object TimeCreated, Id, LevelDisplayName, Message
           
                    $form73 = New-Object System.Windows.Forms.Form
                    $form73.Text = "Resultat recherche"
                    $form73.Size = New-Object System.Drawing.Size(1920, 1080)
                    $form73.StartPosition = "Manual"
                    $form73.BackColor = $backred
                    $dataGridView = New-Object System.Windows.Forms.DataGridView
                    $dataGridView.Location = New-Object System.Drawing.Point(10,20)
                    $dataGridView.Size = New-Object System.Drawing.Size(1700, 900)
                    $dataGridView.ReadOnly = $true
                    $dataGridView.AllowUserToAddRows = $false
                    $dataGridView.AllowUserToDeleteRows = $false
                    $dataGridView.AllowUserToOrderColumns = $true
                    $dataGridView.AutoSizeColumnsMode = 'Fill'
                    $dataGridView.DefaultCellStyle.WrapMode = 'True'
                    $dataGridView.AutoSizeRowsMode = 'AllCells'
                    $dataGridView.SelectionMode = 'FullRowSelect'
                    $dataGridView.DataSource = [System.ComponentModel.BindingList[object]]::new($eventout)
                    $form73.Controls.Add($dataGridView)

                    $buttonquit = New-Object System.Windows.Forms.Button
                    $buttonquit.Text = "Quitter"
                    $buttonquit.Location = New-Object System.Drawing.Point(1750, 20)
                    $buttonquit.Size = New-Object System.Drawing.Size(150, 30)
                    $buttonquit.Font = $boldbutton
                    $buttonquit.BackColor = $quitbackcolor
                    $buttonquit.ForeColor = $textblack
                    $buttonquit.Add_Click({
                        $form73.Close()
                    })
                    $form73.Controls.Add($buttonquit)
                    $form73.ShowDialog()
                }
    })
    $form71.Controls.Add($button72)

    $button73 = New-Object System.Windows.Forms.Button
    $button73.Text = "Rapp fiabilite"
    $button73.Location = New-Object System.Drawing.Point(200, 90)
    $button73.Size = New-Object System.Drawing.Size(175, 30)
    $button73.Add_Click({
    perfmon /rel
    })
    $form71.Controls.Add($button73)

#### Relance du services d'imp ####

    $button74 = New-Object System.Windows.Forms.Button
    $button74.Text = "Reboot svc imp"
    $button74.Location = New-Object System.Drawing.Point(390, 90)
    $button74.Size = New-Object System.Drawing.Size(175, 30)
    $button74.Add_Click({
    Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c net stop spooler && net start spooler && timeout /t 5"
    })
    $form71.Controls.Add($button74)

#### Ouvrir services ####

    $button75 = New-Object System.Windows.Forms.Button
    $button75.Text = "Ouvrir les services"
    $button75.Location = New-Object System.Drawing.Point(390, 50)
    $button75.Size = New-Object System.Drawing.Size(175, 30)
    $button75.Add_Click({
    services.msc
    })
    $form71.Controls.Add($button75)

#### Ouvrir serveur imp ####

    $button76 = New-Object System.Windows.Forms.Button
    $button76.Text = "Printmgmt"
    $button76.Location = New-Object System.Drawing.Point(390, 130)
    $button76.Size = New-Object System.Drawing.Size(175, 30)
    $button76.Add_Click({
    printmanagement.msc
    })
    $form71.Controls.Add($button76)

#### Win update ####

    $button77 = New-Object System.Windows.Forms.Button
    $button77.Text = "Windows Update"
    $button77.Location = New-Object System.Drawing.Point(10, 90)
    $button77.Size = New-Object System.Drawing.Size(175, 30)
    $button77.Add_Click({
    control update
    })
    $form71.Controls.Add($button77)

#### Powercfg ####

    $button78 = New-Object System.Windows.Forms.Button
    $button78.Text = "Options d'alimentation"
    $button78.Location = New-Object System.Drawing.Point(10, 130)
    $button78.Size = New-Object System.Drawing.Size(175, 30)
    $button78.Add_Click({
    powercfg.cpl
    })
    $form71.Controls.Add($button78)

#### btn startup ####

    $button79 = New-Object System.Windows.Forms.Button
    $button79.Text = "Dossiers de démarrage"
    $button79.Location = New-Object System.Drawing.Point(10, 170)
    $button79.Size = New-Object System.Drawing.Size(175, 30)
    $button79.Add_Click({
    Start-Process "explorer.exe" "shell:common startup"
    Start-Process "explorer.exe" "shell:startup"
    })
    $form71.Controls.Add($button79)

#### Compmgmt ####

    $buttoncm = New-Object System.Windows.Forms.Button
    $buttoncm.Text = "Gestion ordinateur"
    $buttoncm.Location = New-Object System.Drawing.Point(10, 210)
    $buttoncm.Size = New-Object System.Drawing.Size(175, 30)
    $buttoncm.Add_Click({
    compmgmt.msc
    })
    $form71.Controls.Add($buttoncm)


#### info poste ####

    $labelinfo = New-Object System.Windows.Forms.Label
    $labelinfo.Location = New-Object System.Drawing.Point(230,260)
    $labelinfo.font = $boldbutton
    $labelinfo.Size = New-Object System.Drawing.Size(150,20)
    $labelinfo.Text = "Information poste :"
    $form71.Controls.Add($labelinfo)

    $button31 = New-Object System.Windows.Forms.Button
    $button31.Text = "Rapport batterie"
    $button31.Location = New-Object System.Drawing.Point(10, 290)
    $button31.Size = New-Object System.Drawing.Size(175, 30)
    $button31.Add_Click({
    Start-Process cmd -Verb runAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList '/c powercfg /batteryreport && "%userprofile%\battery-report.html"'
    })
    $form71.Controls.Add($button31)

    $button32 = New-Object System.Windows.Forms.Button
    $button32.Text = "Numéro de série"
    $button32.Location = New-Object System.Drawing.Point(200, 290)
    $button32.Size = New-Object System.Drawing.Size(175, 30)
    $button32.Add_Click({
    Start-Process cmd -Verb runAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList '/c wmic bios get serialnumber && pause'
    })
    $form71.Controls.Add($button32)

    $button33 = New-Object System.Windows.Forms.Button
    $button33.Text = "Information système"
    $button33.Location = New-Object System.Drawing.Point(390, 290)
    $button33.Size = New-Object System.Drawing.Size(175, 30)
    $button33.Add_Click({
    msinfo32
    })
    $form71.Controls.Add($button33)

#### Sortie ####

    $buttonquit = New-Object System.Windows.Forms.Button
    $buttonquit.Text = "Quitter"
    $buttonquit.Location = New-Object System.Drawing.Point(210, 340)
    $buttonquit.Size = New-Object System.Drawing.Size(150, 30)
    $buttonquit.Font = $boldbutton
    $buttonquit.BackColor = $quitbackcolor
    $buttonquit.ForeColor = $textblack
    $buttonquit.Add_Click({
        $form71.Close()
    })
    $form71.Controls.Add($buttonquit)
    $form71.ShowDialog()
}
function app{

    $form8 = New-Object System.Windows.Forms.Form
    $form8.Text = "Menu des Applications"
    $form8.Size = New-Object System.Drawing.Size(300, 380)
    $form8.StartPosition = "CenterScreen"
    $form8.BackColor = $backred
    $form8.ForeColor = $textwhite

    $button81 = New-Object System.Windows.Forms.Button
    $button81.Text = "Intel support assistant"
    $button81.Location = New-Object System.Drawing.Point(10, 10)
    $button81.Size = New-Object System.Drawing.Size(250, 30)
    $button81.Add_Click({
        Start-Process https://dsadata.intel.com/installer
    })
    $form8.Controls.Add($button81)

    $button82 = New-Object System.Windows.Forms.Button
    $button82.Text = "Malwarebytes"
    $button82.Location = New-Object System.Drawing.Point(10, 50)
    $button82.Size = New-Object System.Drawing.Size(250, 30)
    $button82.Add_Click({
        Start-Process "https://www.malwarebytes.com/fr/mwb-download/thankyou"
    })
    $form8.Controls.Add($button82)

    $button83 = New-Object System.Windows.Forms.Button
    $button83.Text = "ADWCleaner"
    $button83.Location = New-Object System.Drawing.Point(10, 90)
    $button83.Size = New-Object System.Drawing.Size(250, 30)
    $button83.Add_Click({
        Start-Process https://adwcleaner.malwarebytes.com/adwcleaner?channel=release
    })
    $form8.Controls.Add($button83)

    $button84 = New-Object System.Windows.Forms.Button
    $button84.Text = "Dell Power Manager"
    $button84.Location = New-Object System.Drawing.Point(10, 130)
    $button84.Size = New-Object System.Drawing.Size(250, 30)
    $button84.Add_Click({
        Start-Process https://dl.dell.com/FOLDER07383273M/5/Dell-Power-Manager-Service_GD7J6_WIN64_3.9.0_A00_03.EXE
    })
    $form8.Controls.Add($button84)

    $button85 = New-Object System.Windows.Forms.Button
    $button85.Text = "Dell support assist"
    $button85.Location = New-Object System.Drawing.Point(10, 170)
    $button85.Size = New-Object System.Drawing.Size(250, 30)
    $button85.Add_Click({
        Start-Process https://downloads.dell.com/serviceability/catalog/SupportAssistinstaller.exe
    })
    $form8.Controls.Add($button85)

    $button86 = New-Object System.Windows.Forms.Button
    $button86.Text = "Treesize (portable)"
    $button86.Location = New-Object System.Drawing.Point(10, 210)
    $button86.Size = New-Object System.Drawing.Size(250, 30)
    $button86.Add_Click({
        Start-Process https://customers.jam-software.de/downloadTrial.php?article_no=101
    })
    $form8.Controls.Add($button86)

    $buttonquit = New-Object System.Windows.Forms.Button
    $buttonquit.Text = "Quitter"
    $buttonquit.Location = New-Object System.Drawing.Point(60, 280)
    $buttonquit.Size = New-Object System.Drawing.Size(150, 30)
    $buttonquit.Font = $boldbutton
    $buttonquit.BackColor = $quitbackcolor
    $buttonquit.ForeColor = $textblack
    $buttonquit.Add_Click({
        $form8.Close()
    })
    $form8.Controls.Add($buttonquit)

    $form8.Add_Shown({ $form8.Activate() })
    [void]$form8.ShowDialog()
}

#### Interface principale ####

function Show-MenuForm {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Menu des Actions"
    $form.Size = New-Object System.Drawing.Size(300, 300)
    $form.BackColor = $backred
    $form.ForeColor = $textwhite
    $form.StartPosition = "CenterScreen"

#### Creation des raccourcis ####

    $button1 = New-Object System.Windows.Forms.Button
    $button1.Text = "1) Creation raccourcis"
    $button1.Location = New-Object System.Drawing.Point(10, 10)
    $button1.Size = New-Object System.Drawing.Size(250, 30)
    $button1.Add_Click({
        makeshortcut
    })
    $form.Controls.Add($button1)

#### Menu des scan systeme ####

    $button2 = New-Object System.Windows.Forms.Button
    $button2.Text = "2) Scan systeme"
    $button2.Location = New-Object System.Drawing.Point(10, 50)
    $button2.Size = New-Object System.Drawing.Size(250, 30)
    $button2.Add_Click({
        scan
    })
    $form.Controls.Add($button2)

#### Relance des app ####

    $button3 = New-Object System.Windows.Forms.Button
    $button3.Text = "3) Relancer une application"
    $button3.Location = New-Object System.Drawing.Point(10, 90)
    $button3.Size = New-Object System.Drawing.Size(250, 30)
    $button3.Add_Click({
        killapp
    })
    $form.Controls.Add($button3)

#### Obs event ####

    $button4 = New-Object System.Windows.Forms.Button
    $button4.Text = "4) Outils Windows"
    $button4.Location = New-Object System.Drawing.Point(10, 130)
    $button4.Size = New-Object System.Drawing.Size(250, 30)
    $button4.Add_Click({
    wintools
    })
    $form.Controls.Add($button4)

#### DL App ####

    $button5 = New-Object System.Windows.Forms.Button
    $button5.Text = "5) Telecharger application"
    $button5.Location = New-Object System.Drawing.Point(10, 170)
    $button5.Size = New-Object System.Drawing.Size(250, 30)
    $button5.Add_Click({
    app
    })
    $form.Controls.Add($button5)

#### Btn reboot ####

    $buttonrbt = New-Object System.Windows.Forms.Button
    $buttonrbt.Text = "Reboot"
    $buttonrbt.Location = New-Object System.Drawing.Point(200, 220)
    $buttonrbt.Size = New-Object System.Drawing.Size(60, 30)
    $buttonrbt.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
    $buttonrbt.Add_Click({
                
                $formconfirm = New-Object System.Windows.Forms.Form
                $formconfirm.Text = "Confirmation"
                $formconfirm.Size = New-Object System.Drawing.Size(300, 120)
                $formconfirm.BackColor = $backred
                $formconfirm.StartPosition = "CenterScreen"

                $labelconfirm = New-Object System.Windows.Forms.Label
                $labelconfirm.Location = New-Object System.Drawing.Point(25,20)
                $labelconfirm.Size = New-Object System.Drawing.Size(300,20)
                $labelconfirm.Text = '!! Attention le poste va redemarrer !!'
                $labelconfirm.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
                $formconfirm.Controls.Add($labelconfirm)
                        
                        $okButton = New-Object System.Windows.Forms.Button
                        $okButton.Location = New-Object System.Drawing.Point(40,50)
                        $okButton.Size = New-Object System.Drawing.Size(75,23)
                        $okButton.Text = 'Reboot'
                        $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
                        $okButton.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
                        $okButton.ForeColor  = 'Red'
                        $formconfirm.AcceptButton = $okButton
                        $formconfirm.Controls.Add($okButton)

                        $cancelButton = New-Object System.Windows.Forms.Button
                        $cancelButton.Location = New-Object System.Drawing.Point(150,50)
                        $cancelButton.Size = New-Object System.Drawing.Size(75,23)
                        $cancelButton.Text = 'Cancel'
                        $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
                        $cancelButton.BackColor = $quitbackcolor
                        $formconfirm.CancelButton = $cancelButton
                        $formconfirm.Controls.Add($cancelButton)
                        $resultconfirm = $formconfirm.ShowDialog()

                                 if ($resultconfirm -eq [System.Windows.Forms.DialogResult]::OK)
                                    {
                                    Write-Host ca redemarre
                                    shutdown /r /t 0
                                    }
                $formconfirm.Add_Shown({$formconfirm.Activate()})   
    })
    $form.Controls.Add($buttonrbt)

#### Sortie ####

    $buttonquit = New-Object System.Windows.Forms.Button
    $buttonquit.Text = "Quitter"
    $buttonquit.Location = New-Object System.Drawing.Point(10, 220)
    $buttonquit.Size = New-Object System.Drawing.Size(150, 30)
    $buttonquit.BackColor = $quitbackcolor
    $buttonquit.Font = $boldbutton
    $buttonquit.ForeColor = $textblack
    $buttonquit.Add_Click({
        $form.Close()
    })
    $form.Controls.Add($buttonquit)

    # Afficher le formulaire
    $form.Add_Shown({ $form.Activate() })
    [void]$form.ShowDialog()
}

#################################################################
#######################DEBUT DU SCRIPT###########################
#################################################################
Show-MenuForm