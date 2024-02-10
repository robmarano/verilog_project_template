<#
 # File: 	makefile.ps1
 # Author: 	Prof. Rob Marano
 # Build and test file for Verilog on Windows using PowerShell
 # Note: icarus verilog and gtkwave must be installed
 #>

# $COMPONENT is named in config.ps1
# Do not forget to add that file in the same directory as this file and set the variable
$ScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
try {
    . ("$ScriptDirectory\config.ps1")
}
catch {
    Write-Host "Error while loading supporting PowerShell Scripts"
    [Environment]::Exit(1)
}

# Clean up from last run
$filesToRemove = @("$COMPONENT", "$COMPONENT.vcd")
Write-Output "Removing files: $filesToRemove"s
#Remove-Item -Path $filesToRemove -ErrorAction SilentlyContinue -Confirm
$filesToRemove | ForEach-Object { Remove-Item -Path $_ -Force -ErrorAction SilentlyContinue -Confirm:$false}

#
# Compile Verilog file
#
# $COMPILER $COFLAGS -o $COMPONENT $TESTBENCH $SRC
$compileProcessOptions = @{
    FilePath = "$COMPILER"
    ArgumentList = @("$COFLAGS", "-o", "$COMPONENT", "$TESTBENCH", "$SRC")
    UseNewEnvironment = $true
}
Start-Process -NoNewWindow -Wait @compileProcessOptions

#
# Simulate Verilog module with testbench
# $(SIMULATOR) $(SFLAGS) $(COMPONENT) $(TESTBENCH) $(SOUTPUT)
$simulateProcessOptions = @{
    FilePath = "$SIMULATOR"
    ArgumentList = @("$SFLAGS", "$COMPONENT", "$SOUTPUT")
    UseNewEnvironment = $true
}
Write-Output @simulateProcessOptions
Start-Process @simulateProcessOptions -NoNewWindow -Wait