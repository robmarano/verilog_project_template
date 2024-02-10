<#
 # File: 	display.ps1
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

#
# Display Verilog module with testbench
# $(SIMULATOR) $(SFLAGS) $(COMPONENT) $(TESTBENCH) $(SOUTPUT)
$displayProcessOptions = @{
    FilePath = "$VIEWER"
    ArgumentList = @("$TBOUTPUT")
    UseNewEnvironment = $true
}
Start-Process @displayProcessOptions -NoNewWindow -Wait