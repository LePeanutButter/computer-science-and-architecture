# PowerShell Scripts

This directory contains PowerShell versions of a series of exercises originally designed for Bash/Solaris Shell. Each script solves a specific case and has been adapted using Windows PowerShell commands and conventions.

## Included Scripts

### 1. Hello World
Source file name: hello_world.ps1

- Clears the screen.
- Displays the message: "Hello World from Shell".

### 2. Line Count in a File
Source file name: lineas_archivo.ps1

- Clears the screen.
- Displays the number of lines in the file `C:\Windows\System32\drivers\etc\hosts`.

### 3. Search Word in a File
Source file name: buscar_palabra.ps1

- Clears the screen.
- Searches for a word provided by the user in a given file.
- Execution: `buscar_palabra.ps1 <word> <file_path>`

### 4. Extract Users and Descriptions
Source file name: consulta_usuarios.ps1

- Retrieves system users and their descriptions.
- Saves the results in a file.

### 5. Search by Permissions
Source file name: buscar_archivos.ps1

- Lists files in a given directory with specific permissions (e.g., `\FullControl`).
- Execution: `buscar_archivos.ps1 <directory_path> <permission>`

### 6. Script Menu
Source file name: menu.ps1

- Allows the user to select and run any of the previous scripts from an interactive menu.
- Includes an option to exit the menu.

### 7. Additional Scripts

#### 7.1 File Type Identifier
Source file name: indicar_tipo.ps1

- Takes a name and directory, determines if the name corresponds to a file, directory, or other type.

#### 7.2 Failed Access Attempts
Source file name: intentos_fallidos.ps1

- Checks system logs for failed root access attempts.
- Displays the date and time of each failed attempt and the total count.

## Requirements
- PowerShell 5.1 or higher
- Script execution permissions (`Set-ExecutionPolicy` may be required)