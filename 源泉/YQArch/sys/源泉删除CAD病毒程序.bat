@ECHO OFF
@CLS 
@COLOR 0A
@ECHO.
@ECHO ========================================
@ECHO =                                      =
@ECHO =  �� "ԴȪ"ɾ��CAD��������V1.3      =
@ECHO =                                      =
@ECHO ========================================
@ECHO.
@ECHO ��ɾ�������е������ļ�(�����ʹ����Щ�ļ�����Ctrl-C�жϲ��ȸ��Ա���):
@ECHO acaddoc.lsp,acad.lsp,acad.fas,acadapq.lsp,acadappp.lsp,acadiso.lsp,
@ECHO acadapp.lsp,acad.vlx,lcm.fas,acad.mnl
@ECHO.
@ECHO ��ر��������е�CAD����ȷ�����밴���������......
@pause>nul
@pushd
@ECHO.
@ECHO ���Ҳ�ɾ����CAD�����ļ�����������......���Ժ�......
@ECHO.
set yqdir=%CD%
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do ( 
if exist %%i: ( 
%%i:
@cd\
@del /f /q /s /a acaddoc.lsp
@del /f /q /s /a acaddoc.fas
@del /f /q /s /a acad20??doc.lsp
@del /f /q /s /a acad20??.lsp
@del /f /q /s /a acad.lsp
@del /f /q /s /a acad.fas
@del /f /q /s /a acadapq.lsp
@del /f /q /s /a acadappp.lsp
@del /f /q /s /a acadapp.lsp
@del /f /q /s /a acad.vlx
@del /f /q /s /a lcm.fas
@del /f /q /s /a acad.mnl
@del /f /q /s /a acad.sys
@del /f /q /s /a acadiso.lsp
@del /f /q /s /a acadiso.fas
@del /f /q /s /a acadsmu.fas
))
if exist %yqdir%\yqarch.mnl (
@copy %yqdir%\yqarch.mnl %yqdir%\acad.lsp
)
@ECHO.
del /f /q %windir%\system32\dwgrun.bat
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v dwgrun /f
@ECHO OK�����С�����CAD�����ļ����Ѿ���ȫ������밴������˳�......
@pause>nul
@popd
