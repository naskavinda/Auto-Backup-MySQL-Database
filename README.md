# Auto-Backup-MySQL-Database
`set dbUser=root` // give your mysql username `root` is the default username<br/>
`set dbPassword="1234"`// give your mysql password<br/>
`set port=3307` // port number of mysql <br/>
`set backupDir="D:\AutoBackUp"` // place of your backup should save<br/>
`set mysqldump="C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump"` // mysqldum.exe location. there provided the default location.<br/>
`set databaseList=word sakila` // databases name you want to backup<br/>

You must chage these five line in the code (line number 4 to 9) 

Other thing is make sure your system date formate is `sunday 09/30/2018` (dddd, MMMM d, yyyy) like this. if not change it like this or you have to chage code line 12 to 17 as your date formate. 

example : - Assuming your date formate is `dd-MM-yyyy` like this.

then you have to chage 12 to 17 line like bellow.

`for /f "tokens=1-3 delims=- " %%i in ("%date%") do (`<br/>
`     set day=%%i`<br/>
`     set month=%%j`<br/>
`     set year=%%k`<br/>
`)`<br/>

Then run this file as a administrator.

