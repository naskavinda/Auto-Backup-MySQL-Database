@echo off

:: make sure to change the settings from line 4-9
set dbUser=root
set dbPassword="1234"
set backupDir="D:\AutoBackUp"
set mysqldump="C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump"

:: get date
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
)

set dirName=%year%_%day%_%month%

:: print the date
echo "dirName"="%dirName%"

:: create backup folder if it doesn't exist
if not exist %backupDir%\%dirName%\   mkdir %backupDir%\%dirName%

:: Database names you want to backup
set list=word sakila

for /d %%f in (%list%) do (
	  ::%mysqldump% -h "localhost" -P 3307 -u %dbUser% -p%dbPassword% %%a -r %backupDir%\%%f.sql
      %mysqldump% --host="localhost" --protocol=tcp --port=3307 --user=%dbUser% -p%dbPassword% --single-transaction --add-drop-table --default-character-set=utf8 --databases %%f > %backupDir%\%dirName%\%%f.sql
)
popd
