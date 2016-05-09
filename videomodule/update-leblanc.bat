@setlocal enableextensions
@cd /d "%~dp0"
%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe MSBuild\MSSQLTask.proj /t:UpdateAfterSvn /p:DevId=leblanc /p:DevLocation=home /p:DevTask=integration /p:ApplicationId=VideoModule /fl /flp:v=diag
pause