@echo off
set xv_path=E:\\Vivaldo\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 7b668a554e1d45c79d15d62bf5d1bf0b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Main_behav xil_defaultlib.Main -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
