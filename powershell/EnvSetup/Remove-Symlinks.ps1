# new-symlink requires elevated privileges
invoke-elevated {
	Import-Module ..\Modules\Pscx
	remove-reparsePoint ~\Documents\WindowsPowerShell
	remove-reparsePoint ~\.gitconfig
	remove-reparsePoint ~\.gitignore
}