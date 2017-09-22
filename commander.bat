@echo off 
REM command list
REM     install
REM     uninstall
REM     pull
REM     commit
REM     quick-commit
REM     push

SET GIT_BASH_PATH="D:\ProgramFiles\Git\bin\bash.exe"
SET MY_GIT_MENY_COMMANDER_PATH="E:\mygitmenu\commander.bat"
SET MY_GIT_MENY_BASE_PATH="E:\mygitmenu"

if "%1%" == "install" (
  call :myGitMenuInstall
)
if "%1%" == "uninstall" (
  call :myGitMenuUninstall
)
if "%1%" == "pull" ( 
  call :myGitMenuPull 
)
if "%1%" == "commit" (
  call :myGitMenuCommit
)
if "%1%" == "quick-commit-push" (
  call :myGitMenuQuickCommitPush
)
if "%1%" == "push" (
  call :myGitMenuPush
)

pause
goto :EOF

:myGitMenuUninstall
  reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-pull" /f
  reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-commit" /f
  reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-push" /f
  reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-quick-commit-push" /f
  
  echo Uninstallation Done
  goto :EOF

:myGitMenuInstall
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-pull" /t REG_SZ /d "Git Pull" /f
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-pull" /v Icon /t REG_SZ /d "%MY_GIT_MENY_BASE_PATH%\resource\image\pull.ico" /f
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-pull\command" /t REG_SZ /d "%MY_GIT_MENY_COMMANDER_PATH% pull" /f
  
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-commit" /t REG_SZ /d "Git Commit" /f
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-commit" /v Icon /t REG_SZ /d "%MY_GIT_MENY_BASE_PATH%\resource\image\commit.ico" /f
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-commit\command" /t REG_SZ /d "%MY_GIT_MENY_COMMANDER_PATH% commit" /f
  
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-push" /t REG_SZ /d "Git Push" /f
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-push" /v Icon /t REG_SZ /d "%MY_GIT_MENY_BASE_PATH%\resource\image\push.ico" /f
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-push\command" /t REG_SZ /d "%MY_GIT_MENY_COMMANDER_PATH% quick-commit-push" /f
  
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-quick-commit-push" /t REG_SZ /d "Git Quick Commit Push" /f
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-quick-commit-push" /v Icon /t REG_SZ /d "%MY_GIT_MENY_BASE_PATH%\resource\image\quickcommitpush.ico" /f
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mygitmenu-quick-commit-push\command" /t REG_SZ /d "%MY_GIT_MENY_COMMANDER_PATH% push" /f
  
  echo Installation Done
  goto :EOF

:myGitMenuQuickCommitPush
  %GIT_BASH_PATH% -c "echo 'Current Path: ' `pwd`"
  %GIT_BASH_PATH% -c "git add ."
  %GIT_BASH_PATH% -c "git commit -m 'committed by mygitmeny quick-commit-push.'"
  %GIT_BASH_PATH% -c "git push"
  goto :EOF
  
:myGitMenuCommit
  set /p commitMessage= Input commit message : 
  %GIT_BASH_PATH% -c "echo 'Current Path: ' `pwd`"
  %GIT_BASH_PATH% -c "git add ."
  %GIT_BASH_PATH% -c "git commit -m %commitMessage%"
  goto :EOF

:myGitMenuPush
  %GIT_BASH_PATH% -c "echo 'Current Path: ' `pwd`"
  %GIT_BASH_PATH% -c "git push"
  goto :EOF
 
:myGitMenuPull
  %GIT_BASH_PATH% -c "echo 'Current Path: ' `pwd`"
  %GIT_BASH_PATH% -c "git pull"
  goto :EOF
  