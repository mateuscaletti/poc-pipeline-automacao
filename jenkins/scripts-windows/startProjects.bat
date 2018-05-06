@echo off

SetLocal EnableDelayedExpansion 

SET WORKSPACE=%~1
SET BUILD_NUMBER=%~2
SET STAGE_NAME=%~3

ECHO Inicializando os projetos do %STAGE_NAME%...

ECHO "WORKSPACE = %WORKSPACE%\projects\%STAGE_NAME%"

for /d %%A in ("%WORKSPACE%"\projects\%STAGE_NAME%\*) do (
	SET SCRIPT_DEFINE=%%A\startProject.bat
	SET PROJECT_NAME=%%~nxA
	
	echo Verificando se existe arquivo '!SCRIPT_DEFINE!' ...
	if exist !SCRIPT_DEFINE! (
		SET RESULT_DIR=%WORKSPACE%\results\instance_%BUILD_NUMBER%\%STAGE_NAME%\!PROJECT_NAME!
		
		echo Projeto !PROJECT_NAME! inicializando...
		echo Criando diretório dos resultados do projeto em "!RESULT_DIR!"...
		mkdir "!RESULT_DIR!"
		echo Executando o projeto
		call !SCRIPT_DEFINE! "%WORKSPACE%" %BUILD_NUMBER% >> "!RESULT_DIR!\execution_%STAGE_NAME%_!PROJECT_NAME!.log"
		echo Projeto '!PROJECT_NAME!' finalizado!
	)
)