$venv="$((Get-Location).tostring())\virtualenv"
$pip_path="$venv\Scripts\pip.exe"

Invoke-Expression "virtualenv $venv"
Invoke-Expression "$pip_path install -r requirements.txt"
