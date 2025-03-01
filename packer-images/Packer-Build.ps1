param(
    [string] $PackerImage,
    [string] $VarFile
)

function PrintLongDash()
{
    Write-Host "========================================================================================================================================"
}

Write-Host "Image name: $PackerImage"

$ImageAbsPath = (Get-Item "$PackerImage").FullName
Write-Host "Image Absolute path: $ImageAbsPath"

Write-Host "VarFile: $VarFile"
$VarFileAbsPath = (Get-Item "$VarFile").FullName
Write-Host "Var File Absolute path: $VarFileAbsPath"

PrintLongDash

Write-Host "Building packer image"

PrintLongDash

packer build -var-file="$VarFileAbsPath" "$ImageAbsPath"
