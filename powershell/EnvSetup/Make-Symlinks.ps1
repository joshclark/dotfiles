# new-symlink requires elevated privileges
Import-Module ..\Modules\Pscx
invoke-elevated {
	Import-Module ..\Modules\Pscx
	new-junction ~\Documents\WindowsPowerShell ..\

	new-symlink ~\.gitconfig ..\..\.gitconfig
	new-symlink ~\.gitignore ..\..\.gitignore
}