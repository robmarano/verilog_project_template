# Verilog Project Template

## To compile:

### On Unix (MacOS and Linux)
```bash
make COMPONENT=example_module compile
```
### On Windows (with Chocolatey installed)
```powershell
.\makefile.ps1 example_module compile
```

## To simulate:
### On Unix (MacOS and Linux)
```bash
make COMPONENT=example_module simulate
```
### On Windows (with Chocolatey installed)
```powershell
.\makefile.ps1 example_module simulate
```


## To display simulation using GTKWAVE:
### On Unix (MacOS and Linux)
```bash
make COMPONENT=example_module display
```
### On Windows (with Chocolatey installed)
```powershell
.\makefile.ps1 example_module display
```


Then choose "example_tb" as your SST. Highlight "uut" and choose all signals, dragging them to Signal area to right. Once done, got to menu Time -> Zoom -> Zoom Bet Fit.


## To clean up all generated files:
### On Unix (MacOS and Linux)
```bash
make COMPONENT=example_module clean
```
### On Windows (with Chocolatey installed)
```powershell
.\makefile.ps1 example_module clean
```