<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/logo-dark.png">
    <source media="(prefers-color-scheme: light)" srcset="assets/logo-light.png">
    <img src="assets/logo-light.png" alt="Mac2Tetris Logo" width="200">
  </picture>
</p>

## 🚀 Installation & Setup Instructions

Or just let your favorite LLM do it for you. Give it this repository link and ask:

```text
Help me set up Mac2Tetris on my Mac:
https://github.com/neriahbd/Mac2Tetris

Read the README and setup scripts, ask where my nand2tetris
folder is, and help me create the macOS simulator apps.
If you can access my computer, perform the setup;
otherwise, guide me through it step by step.
```

### **Step 1:**
Place the `utils` folder inside your `nand2tetris/tools` directory.

---

### **Step 2:**
Create a custom **Automator app**:
1. Open the **Automator** app (pre-installed on macOS).
2. Click **New Document → Application**.
3. Use the search bar to find **Run AppleScript**, then drag it into the workflow pane.
4. Copy the contents of `./utils/AppleScript.rtf` into the AppleScript editor.
5. Save the file as `mac2tetris.app` inside the `nand2tetris/tools` directory.

---

### **Step 3:**
Double-click `mac2tetris.app`.  
It will automatically generate `.app` files for all **Nand2Tetris simulators**.

**# If there is a restriction warning:** 
Remove macOS security restrictions of downloaded files by running:
```bash
xattr -d com.apple.quarantine utils/script.sh
```

---

### **Step 4 (Optional):**
Once the process is complete, you can safely delete:
```
utils/
mac2tetris.app
```

---

## 💻 Enjoy the Convenience
You can now launch your **Nand2Tetris simulators** directly with a **simple double-click** or even from **Spotlight search** — no more terminal commands required!

---

<p align="center">
  <b>Created by:</b> Neriah Ben David
</p>
