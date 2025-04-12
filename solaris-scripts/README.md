# Solaris Shell Scripts

This directory contains Shell (Bash) scripts designed to run on UNIX-like environments (such as Solaris). All scripts have been validated using ShellCheck to ensure best practices and avoid common errors.

## Included Scripts

### 1. Hello World
Source file name: hello_world.sh

- Clears the screen.
- Displays the message: "Hello World from Shell".

### 2. Line Count in File
Source file name: lineas_archivo.sh

- Clears the screen.
- Displays how many lines are in the file `/etc/profile`.

### 3. Search Word in File
Source file name: buscar_palabra.sh

- Clears the screen.
- Searches for a word given by the user in a specified file.
- Execution: `buscar_palabra.sh <word> <file_path>`

### 4. Extract Users and Descriptions
Source file name: consulta_usuarios.sh

- From the `/etc/passwd` file, extracts user names and their descriptions.
- Saves the result in a file.

### 5. Search by Permissions
Source file name: buscar_archivos.sh

- Lists files in a specified directory that have specific permissions (e.g., `-rw-r--r--`).
- Execution: `buscar_archivos.sh <directory_path> <permissions>`

### 6. Shell Menu
Source file name: menu.sh

- Allows the user to select and run any of the previous scripts through an interactive menu.
- Includes an option to exit.

### 7. Additional Scripts

#### 7.1 File Type Identifier
Source file name: indicar_tipo.sh

- Takes a name and directory, determines if it is a file, subdirectory, or other type of file.

#### 7.2 Check for Failed Access Attempts
Source file name: intentos_fallidos.sh

- Checks for failed root access attempts.
- Displays the date and time of each failed attempt and the total number.

## Requirements
- UNIX or compatible system (Solaris, Linux, etc.)
- Bash Shell
- Script execution permissions (`chmod +x script.sh`)