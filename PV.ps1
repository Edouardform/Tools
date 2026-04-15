#### create directories ####
$date = Get-Date -Format "dd_MM_yy"
$parent = "Sav_$date"
$directory = "C", "C\Appdata", "D", "Logiciel\GC", "Logiciel\CO", "Logiciel\PV", "Logiciel\PA", "Navigateur\chrome", "Navigateur\edge", "Navigateur\firefox"

foreach ($d in $directory)
{
New-Item -ItemType Directory -name "$parent\$d"
}




