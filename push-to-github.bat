@echo off
setlocal
cd /d "%~dp0"

echo.
echo ==================================================
echo   Lyndon Alumni site - push update to GitHub
echo ==================================================
echo.

echo Looking at what's changed since the last push...
echo.
git status --short
echo.

git add -A

REM If nothing is staged, there's nothing to push
git diff --cached --quiet
if not errorlevel 1 (
  echo --------------------------------------------------
  echo Nothing new to push - GitHub already has the latest.
  echo --------------------------------------------------
  echo.
  pause
  exit /b 0
)

echo --------------------------------------------------
set /p msg=Describe what you changed (one short sentence):
echo.

if "%msg%"=="" (
  echo No description entered. Cancelling - nothing was saved.
  echo.
  pause
  exit /b 1
)

echo Saving your change...
git commit -m "%msg%"
if errorlevel 1 (
  echo.
  echo Something went wrong saving. Stopped.
  pause
  exit /b 1
)

echo.
echo Sending to GitHub...
git push
if errorlevel 1 (
  echo.
  echo Push to GitHub failed. Your change is saved on your computer
  echo but did not reach GitHub yet. Check your internet and try again,
  echo or run this script a second time.
  pause
  exit /b 1
)

echo.
echo ==================================================
echo   Done! Your changes are live on GitHub.
echo   https://github.com/almaster1987/lyndon-alumni
echo ==================================================
echo.
pause
