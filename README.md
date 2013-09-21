dotfiles
========

1. Change to your user's home directory: 
  cd c:\users\<username>
  
2. Clone the repo
  git clone https://github.com/joshclark/dotfiles.git dotfiles
  cd dotfiles
  git submodule init
  git submodule update
  
3. Make sure you can run scripts in powershell
  Set-ExecutionPolicy Unrestricted

4. cd powershell\EnvSetup
5. .\Make-Symlinks.ps1
  
