dotfiles
========

* Change to your user's home directory: 
  cd c:\users\<username>
  
* Clone the repo

```
    git clone https://github.com/joshclark/dotfiles.git dotfiles
    
    cd dotfiles
    
    git submodule init
    
    git submodule update
```

* Make sure you can run scripts in powershell

```
  Set-ExecutionPolicy Unrestricted
```

* Setup the powershell environment

```
    cd powershell\EnvSetup
    .\Make-Symlinks.ps1
  
```
