
########################################################
# Prompt
function prompt {

    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor
    
    # Determine what nesting level we are at (if any)
    $nestingLevel = ''
    if ($nestedpromptlevel -ge 1) {
        $nestingLevel = "[Nested:${nestedpromptlevel}]"
    }
    
    # Output prompt string
    write-host "${nestingLevel}[" -nonewline
    write-host -fore green $(Get-Location) -nonewline
    write-host "]" -nonewline

    Write-VcsStatus
    write-host "`n" -nonewline


    $LASTEXITCODE = $realLASTEXITCODE
    return "> "
}



########################################################



########################################################
# Custom PS-only path settings
#   use this for directories that contain PS1 
#   files since they generally can't be run 
#   outside of PowerShell
#
#function script:append-path {
#	$oldPath = get-content Env:\Path;
#	$newPath = $oldPath + ";" + $args;
#	set-content Env:\Path $newPath;
#}

#append-path (resolve-path '~/PowerShell Scripts').Path
########################################################


########################################################
# 'go' command and targets
if( $GLOBAL:go_locations -eq $null ) {
	$GLOBAL:go_locations = @{};
}

function go ([string] $location) {
	if( $go_locations.ContainsKey($location) ) {
		set-location $go_locations[$location];
	} else {
		write-output "The following locations are defined:";
		write-output $go_locations;
	}
}

$go_locations.Add("home", "~")
$go_locations.Add("dl", "d:\Downloads")
$go_locations.Add("code", "d:\code")
$go_locations.Add("core", "d:\code\Orion\Core")
$go_locations.Add("nf", "d:\code\Orion\NetFlow")
$go_locations.Add("apm", "D:\code\APM\Orion\APM\Src")
$go_locations.Add("src", "D:\code\npm\DEV\Main\Orion")
$go_locations.Add("npm", "D:\code\npm\DEV\Main\Orion")

########################################################

function strip-extension ([string] $filename) { 
	[system.io.path]::getfilenamewithoutextension($filename)
} 


#########################################################
function tidy() {
	([xml] (Get-Clipboard)) | Format-Xml | Out-Clipboard
}

function vcvars() {
	#Set environment variables for Visual Studio Command Prompt
	pushd 'c:\Program Files (x86)\Microsoft Visual Studio 11.0\VC'
	cmd /c "vcvarsall.bat&set" |
	foreach {
	  if ($_ -match "=") {
	    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
	  }
	}
	popd
	write-host "`nVisual Studio 2012 Command Prompt variables set." -ForegroundColor Yellow	
}
