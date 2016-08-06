@echo off
cd a
git pull

for /D %%a in (*) do call:createDoc %%a
pause
goto:eof

:createDoc
if %~1 EQU ".git" goto:eof
cd %~1
"C:\Program Files\7-Zip\7z" a -tzip doc.zip  *
move doc.zip ..\..\%~1.docx
goto:eof


