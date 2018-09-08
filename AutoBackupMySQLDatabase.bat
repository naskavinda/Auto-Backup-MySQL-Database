@echo off

:: You must provided you data in next five line 
set dbUser=root
set dbPassword="1234"
set port=3307
set backupDir="D:\AutoBackUp"
set mysqldump="C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump"
set databaseList=word sakila

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

for /d %%f in (%databaseList%) do (
      %mysqldump% --host="localhost" --protocol=tcp --port=%port% --user=%dbUser% -p%dbPassword% --single-transaction --add-drop-table --default-character-set=utf8 --databases %%f > %backupDir%\%dirName%\%%f.sql
)
popd
