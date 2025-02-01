# makefile.ps1
# USAGE: .\makefile.ps1 your_module_name {compile, simulate, display, clean}
#
# Get the command line arguments
$COMPONENT = $args[0] # Name of the module
$command = $args[1]

#$COMPONENT = "dff" # Name of the module
#
$SRC = "$COMPONENT.sv"
$TESTBENCH = "tb_$COMPONENT.sv"
$TBOUTPUT = "tb_$COMPONENT.vcd"
$filesToRemove = @("$COMPONENT", "$TBOUTPUT")

# TOOLS
# You need to update the paths below to the tools in your system
$COMPILER = "C:\ProgramData\chocolatey\bin\iverilog.exe"
$SIMULATOR = "C:\ProgramData\chocolatey\bin\vvp.exe"
$VIEWER = "C:\ProgramData\chocolatey\bin\gtkwave.exe" # GUI app
# TOOL OPTIONS
$COFLAGS = "-g2012"
$SFLAGS = "-M ."		#SIMULATOR FLAGS
$SOUTPUT = "-lxt2"		#SIMULATOR OUTPUT TYPE

# Use a switch statement to handle different commands
switch ($command) {
    'compile' {
        # Code to execute when the command is 'compile'
        Write-Host "Compiling..."
        #
        # Compile Verilog file
        #
        # $COMPILER $COFLAGS -o $COMPONENT $TESTBENCH $SRC
        $compileProcessOptions = @{
            FilePath          = "$COMPILER"
            ArgumentList      = @("$COFLAGS", "-o", "$COMPONENT", "$TESTBENCH", "$SRC")
            UseNewEnvironment = $true
        }
        Start-Process -NoNewWindow -Wait @compileProcessOptions
    }
    'simulate' {
        # Code to execute when the command is 'simulate'
        Write-Host "Simulating..."
        #
        # Simulate Verilog module with testbench
        # $(SIMULATOR) $(SFLAGS) $(COMPONENT) $(TESTBENCH) $(SOUTPUT)
        $simulateProcessOptions = @{
            FilePath          = "$SIMULATOR"
            ArgumentList      = @("$SFLAGS", "$COMPONENT", "$SOUTPUT")
            UseNewEnvironment = $true
        }
        Write-Output @simulateProcessOptions
        Start-Process @simulateProcessOptions -NoNewWindow -Wait
    }
    'display' {
        # Code to execute when the command is 'display'
        Write-Host "Displaying..."
        #
        # Display Verilog module with testbench
        # $(SIMULATOR) $(SFLAGS) $(COMPONENT) $(TESTBENCH) $(SOUTPUT)
        $displayProcessOptions = @{
            FilePath          = "$VIEWER"
            ArgumentList      = @("$TBOUTPUT")
            UseNewEnvironment = $true
        }
        Start-Process @displayProcessOptions -NoNewWindow -Wait
    }
    'clean' {
        # Code to execute when the command is 'display'
        Write-Host "Cleaning up..."
        # Clean up from last run
        Write-Output "Removing files: $filesToRemove"
        $filesToRemove | ForEach-Object { Remove-Item -Path $_ -Force -ErrorAction SilentlyContinue -Confirm:$false }

    }
    default {
        # Code to execute when the command is not recognized
        Write-Host "Incorrect use of '.\makefile.ps1'. `nPlease provide the Verilog module name and the command to run with options given as follows:"
        Write-Host "`t.\makefile.ps1 <module_name> <command - 'compile', 'simulate', 'display', 'clean'>"
    }
}