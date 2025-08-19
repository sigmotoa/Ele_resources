# Windows Setup Guide for AVR Development

## Software Requirements

### Required Tools
1. **AVR-GCC Toolchain** - Cross-compiler for AVR microcontrollers
2. **AVRDUDE** - Programming utility for AVR microcontrollers
3. **Make** - Build automation tool
4. **Arduino IDE** (if using Arduino as ISP programmer)

## Installation Options

### Option 1: MSYS2 (Recommended)
Best for developers who want a Unix-like environment on Windows.

1. **Install MSYS2**
   - Download from: https://www.msys2.org/
   - Run the installer and follow instructions

2. **Install AVR tools**
   ```bash
   # Open MSYS2 terminal and run:
   pacman -S mingw-w64-x86_64-avr-gcc
   pacman -S mingw-w64-x86_64-avrdude  
   pacman -S make
   ```

3. **Add to PATH** (if needed)
   - Add `C:\msys64\mingw64\bin` to Windows PATH

### Option 2: Arduino IDE Tools
Easiest option if you already use Arduino IDE.

1. **Install Arduino IDE**
   - Download from: https://www.arduino.cc/
   - AVR tools are included in installation

2. **Add Arduino tools to PATH**
   - Add these paths to Windows PATH:
     - `C:\Program Files (x86)\Arduino\hardware\tools\avr\bin`
     - `C:\Users\[username]\AppData\Local\Arduino15\packages\arduino\tools\avr-gcc\[version]\bin`

### Option 3: WinAVR (Legacy)
Older but still functional option.

1. **Download WinAVR**
   - From: https://winavr.sourceforge.net/
   - Note: Last updated in 2010, may have compatibility issues

2. **Install and add to PATH**
   - Install WinAVR
   - Add installation directory to Windows PATH

## Hardware Setup

### Arduino as ISP Programmer
1. **Upload ArduinoISP sketch**
   - Open Arduino IDE
   - File → Examples → 11.ArduinoISP → ArduinoISP
   - Upload to your Arduino

2. **Connect ATtiny45 to Arduino**
   ```
   Arduino → ATtiny45
   Pin 10  → Pin 1 (Reset)
   Pin 11  → Pin 5 (MOSI)
   Pin 12  → Pin 6 (MISO)
   Pin 13  → Pin 7 (SCK)
   5V      → Pin 8 (VCC)
   GND     → Pin 4 (GND)
   ```

3. **Find COM Port**
   - Check Device Manager → Ports (COM & LPT)
   - Update `PORT = COM3` in Makefile.windows

## Usage

### Basic Commands
```cmd
# Check if tools are installed
make -f Makefile.windows check-tools

# Build project
make -f Makefile.windows

# Upload to microcontroller
make -f Makefile.windows upload

# Set fuses (one-time setup)
make -f Makefile.windows fuses

# Clean build files
make -f Makefile.windows clean

# Show help
make -f Makefile.windows help
```

### Troubleshooting

**Common Issues:**
- **Port not found**: Update `PORT` variable in Makefile.windows
- **Permission denied**: Run Command Prompt as Administrator
- **Tools not found**: Verify PATH includes AVR toolchain directories
- **Upload fails**: Check Arduino connections and ensure ArduinoISP is uploaded

**Verify Installation:**
```cmd
avr-gcc --version
avrdude -?
make --version
```