Say Goodbye to Terminal Hassles with mac2tetris!

Tired of always launching Nand2Tetris tools through the terminal, while your Windows-using friends enjoy the simplicity of opening an app?
mac2tetris is here to make your life easier!

Installation & Setup Instructions

Step 1:
Place the utils folder inside your nand2tetris/tools directory.

Step 2:
Create a custom Automator app:
	1.	Open the Automator app (pre-installed on macOS).
	2.	Click New Document → Application.
	3.	Use the search bar to find Run AppleScript, then drag it into the workflow pane.
	4.	Copy the contents of ./utils/AppleScript.rtf into the AppleScript editor.
	5.	Save the file as mac2tetris.app in the nand2tetris/tools directory.

Step 3:
Run the following command in your terminal to remove security restrictions:
xattr -d com.apple.quarantine utils/script.sh

Step 4:
Double-click mac2tetris.app. It will generate .app files for all Nand2Tetris simulators.

Step 5 (Optional):
Once the process is complete, you can safely delete the utils folder and mac2tetris.app file.

Enjoy the Convenience

You can now launch your Nand2Tetris simulators directly with a simple double-click or from spotlight search.

Created by: Neriya Ben David
