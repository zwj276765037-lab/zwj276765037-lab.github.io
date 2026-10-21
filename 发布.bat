@echo off
cd /d "%~dp0"
set MSG=%*
if "%MSG%"=="" set MSG=update site
echo [1/3] staging
git add -A
echo [2/3] commit
git commit -m "%MSG%"
echo [3/3] push
git -c http.proxy= -c https.proxy= push
echo.
echo Done. Open https://zwj276765037-lab.github.io/ in ~30s
pause
