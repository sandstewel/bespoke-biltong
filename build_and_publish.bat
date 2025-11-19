@echo off
REM ========================================
REM Simple one-click build and publish script
REM ========================================

REM >>> CHANGE THIS to your project folder <<<
cd /d "C:\Users\27832\my-zensical-project"

echo Switching to main branch...
git checkout main
git pull origin main

echo Building site with Zensical...
zensical build --clean

echo Staging changes...
git add .

REM Check if anything changed
git diff-index --quiet HEAD
if %ERRORLEVEL% NEQ 0 (
    echo Committing changes...
    git commit -m "Auto-update site"
    echo Pushing to GitHub...
    git push origin main
    echo Done! GitHub will deploy your site shortly.
) else (
    echo No changes to commit. Nothing pushed.
)

echo.
echo ===== Finished. You can now open your site. =====
pause
