@rem args: %1=build|rebuild|clean %2=$(Configuration)
setlocal
set OUTPUT_DIR=..\..\..\BuildOutput\Nuget\%2
set clean=

REM if /i '%1'=='rebuild' set clean=true
REM if /i '%1'=='clean' set clean=true
if DEFINED clean del /q %OUTPUT_DIR%\Llvm.NET.*.nupkg
if '%1'=='clean' goto :return

if NOT EXIST %OUTPUT_DIR% md %OUTPUT_DIR%
packages\NuGet.CommandLine.2.8.6\tools\nuget pack Llvm.NET.nuspec -OutputDirectory %OUTPUT_DIR% -Properties configuration=%2

:return
endlocal