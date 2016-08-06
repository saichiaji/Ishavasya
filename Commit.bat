@echo on

for %%i in (*.docx) do call:myFunc %%~di %%~pi %%~ni 
call:commit
pause
goto:eof



:commit
cd a
git add -A
git commit -a -m "Message"
git push
goto:eof


:myFunc
cd a
if not exist %~1%~2\a\%~3 mkdir %~1%~2\a\%~3
cd %~3
copy ..\..\%~3.docx doc.zip
"C:\Program Files\7-Zip\7z" x doc.zip -aoa
del doc.zip
cd ..\..
goto:eof

