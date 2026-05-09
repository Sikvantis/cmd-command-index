# cmd-command-index
A lightweight Windows batch utility that lists your custom CMD commands similarly to the built-in `help` command.

It automatically:

* Scans the current folder for .bat files
* Reads descriptions from lines starting with ::
* Aligns output dynamically
* Excludes info.bat itself
* Works from any location without hardcoded paths

==================================================
EXAMPLE OUTPUT
==============

backup      - Creates a backup
deploy      - Deploys the project
cleanup     - Removes temporary files

==================================================
SETUP
=====

1. Create a Commands Folder

Example:

C:\MyCommands

Place:

* info.bat
* your custom .bat commands

inside this folder.

Example:

C:\MyCommands
│
├── info.bat
├── backup.bat
├── cleanup.bat
└── deploy.bat

================================================
2. Add the Folder to PATH
=========================

The folder containing the batch files must be added to the Windows PATH.

Windows 10 / 11:

1. Open Start Menu
2. Search for:
   Environment Variables
3. Open:
   Edit the system environment variables
4. Click:
   Environment Variables
5. Under User variables:

   * Select Path
   * Click Edit
6. Add your commands folder:

C:\MyCommands

7. Press OK on all windows.

==================================================
3. Restart CMD
==============

Close and reopen Command Prompt.

==================================================
USAGE
=====

Run:

info

This will display all available commands and their descriptions.

==================================================
ADDING DESCRIPTIONS
===================

Add a line starting with :: anywhere in the batch file.

Example:

:: Creates a backup
@echo off
echo Backing up files...

The first :: line found will be used as the description.

==================================================
NOTES
=====

* Only .bat files are scanned
* info.bat is automatically excluded
* Descriptions are optional
* Output alignment is automatic
* No external dependencies required

==================================================

								    _   _     
								   '\\-//`    
								    (o o)     
								ooO--(_)--Ooo-
              
              
              
              
