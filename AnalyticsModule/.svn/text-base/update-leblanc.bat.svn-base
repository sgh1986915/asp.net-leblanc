@setlocal enableextensions
@cd /d "%~dp0"
%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe MSBuild\build.proj /t:UpdateAfterSvn /p:DevId=leblanc /p:DevLocation=home.desktop /p:DevTask=integration /p:ApplicationId=AreaModule /fl /flp:v=diag
pause