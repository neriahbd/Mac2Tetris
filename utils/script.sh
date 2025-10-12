#!/bin/bash

# Get the directory of the script (i.e., tools/mac2tetris)
script_dir="$(dirname "$(realpath "$0")")"

# Set the output directory to the tools folder (the parent of the script directory)
output_dir="$(dirname "$script_dir")"  # This will be 'tools'

# Path to the icon file in the tools folder
icon_path="$output_dir/utils/icon.icns"

# Array of app names and corresponding scripts
apps=("CPUEmulator" "HardwareSimulator" "Assembler" "JackCompiler" "VMEmulator" "TextComparer")
scripts=(
    "$output_dir/CPUEmulator.sh"
    "$output_dir/HardwareSimulator.sh"
    "$output_dir/Assembler.sh"
    "$output_dir/JackCompiler.sh"
    "$output_dir/VMEmulator.sh"
    "$output_dir/TextComparer.sh"
)

# Loop to create each Automator app in the current tools folder
for i in "${!apps[@]}"; do
    app_name="${apps[i]}"
    script_path="${scripts[i]}"

    # Create a new Automator application bundle directly inside the tools folder
    automator_app_path="$output_dir/$app_name.app"
    mkdir -p "$automator_app_path/Contents/MacOS"
    mkdir -p "$automator_app_path/Contents/Resources"

    # Write a shell script into the Automator app bundle
    echo "#!/bin/bash
open -a Terminal \"$script_path\"" > "$automator_app_path/Contents/MacOS/$app_name"

    # Make the script executable
    chmod +x "$automator_app_path/Contents/MacOS/$app_name"

    # Copy the icon.icns file to the Resources folder for each app (if it exists)
    if [[ -f "$icon_path" ]]; then
        cp "$icon_path" "$automator_app_path/Contents/Resources/AppIcon.icns"
    else
        echo "Warning: Icon file icon.icns not found at $icon_path. App will not have an icon."
    fi

    # Create the Info.plist file for the app
    cat << EOF > "$automator_app_path/Contents/Info.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>$app_name</string>
    <key>CFBundleIdentifier</key>
    <string>com.example.$app_name</string>
    <key>CFBundleName</key>
    <string>$app_name</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleIconFile</key>
    <string>AppIcon.icns</string>
</dict>
</plist>
EOF
done

echo "Automator applications for Nand2Tetris Course created directly in the tools folder."