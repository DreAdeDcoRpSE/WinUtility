# Windows Utility (WinUtility)

**Author:** coRpSE (Derek McGuire)  
**License:** [GNU General Public License v3.0](https://opensource.org/licenses/GPL-3.0)  
**Platform:** Windows 11 (compatible with many Windows 10 functions)

---

## Overview

Windows Utility, also known as **WinUtility**, is a comprehensive, all-in-one batch file system maintenance and troubleshooting hub for Windows 11. Originally created in 2008 as a simple temp file cleaner, it has evolved into a full-featured utility that consolidates hidden Windows functions, optimizes system maintenance, and makes them accessible through an intuitive menu interface.

Unlike built-in Windows tools, many of which are buried deep in menus and hard to access, WinUtility centralizes essential tasks, automates routine maintenance, and provides clear feedback, all without needing extra software.

---

## Why This Script Exists

Windows hides essential maintenance and troubleshooting tools deep in menus, requiring multiple clicks to access. WinUtility was created to:

- Give users a single, easy-to-use hub for essential system tasks.
- Automate and simplify tasks like cleaning, network checks, disk management, and battery reports.
- Make hidden or complex Windows commands accessible without memorization.
- Offer a lightweight, local solution requiring no installation beyond the `.bat` file itself.

The utility is designed specifically for **Windows 11**, while retaining and updating functions from previous Windows 10 versions.

---

## Installation

1. Download `WinUtility.bat` from this repository.
2. Place it in any location on your PC.
3. Double-click the file to run it.
   - No installation is necessary.
   - The script includes an **auto-administration system**: if it is not run as Administrator, it will automatically restart itself with elevated privileges, so you don’t need to manually run it as Administrator.

Alternatively, you can create a new `.bat` file and paste the entire code into it, then run it as above.

---

## Features

WinUtility includes a wide array of tools organized in a menu system:

### Cleaning
1. **Simple CleanUp** – removes common temp files.
2. **Deeper CleanUp** – more comprehensive system cleaning for Windows 11.

### System & Hardware
3. **System Information** – detailed info using PowerShell (replaces deprecated WMIC), including RAM, HD space, uptime, motherboard, BIOS, and networking details.
4. **Check & Repair Windows 11** – built-in Windows maintenance checks.
5. **Image Repair 11** – optional repair if issues are found.
6. **Check Disk** – health and repair options for your drives.

### File & Disk Tools
7. **Open Host File** – edit easily without hunting for it.
8. **Open Disk Cleanup** – launches the built-in utility.
9. **Open Disk Management** – access standard and updated locations.

### Network Tools
10. **Network Check** – ping/traceroute defaults to `google.com`.
11. **Custom Ping/Traceroute** – target any IP or URL.
12. **Flush DNS** – release/renew DHCP and flush cache.
13. **Reset Network Adapters** – quick reset for connectivity issues.
14. **Port Listing** – see active ports and services.

### Monitoring & Reporting
15. **Reliability Monitor** – view Windows reliability history.
16. **Event Viewer** – open Windows Event Viewer.
17. **Create Installed Programs List** – export list of installed software.
18. **Battery Report** – generates a readable battery report for laptops; skips desktops.

### Automation & Customization
19. **Windows AutoClean on Boot** – automatically clean temp files on startup.
20. **Power Configuration** – tweak laptop power settings.
21. **Windows Color Calibration**
22. **Make GodMode Shortcut** – all system settings in one folder.
23. **Rebuild Icon Cache** – refresh desktop icons.
24. **Retrieve Windows 11 Product Key** – useful for OEM systems without stickers.
25. **Drive Tree Exporter** – document folder structure.
26. **Virus Scan** – Windows Defender quick or full scan.
27. **Uninstaller (Semi Advanced)** – easier removal of software.
28. **Restart into BIOS**

---

## How to Use

- Run the `.bat` file.
- The menu will display all available functions.
- Type the number corresponding to the desired function and press **Enter**.
- Follow on-screen prompts.
- Many sections offer **Y/N** or other input choices for advanced operations.
- Administrator access is handled automatically for full functionality. But, you can still start it in Adminstrator if you like.

---

## History & Background

This project started in **2008** as a simple cleaning script for temp files. Over time, it evolved into a full system maintenance utility with a menu interface. Frustration with hidden Windows tools and multiple steps for simple tasks motivated the creation and expansion of this script.  

The current release updates **all features for Windows 11**, adds new reporting, network, and power configuration tools, and improves usability and automation.

---

## License

This project is licensed under the **[GNU General Public License v3.0](https://opensource.org/licenses/GPL-3.0)**. You are free to use, modify, and distribute the code, provided you include proper attribution to the author.

---

## Notes

- Designed for **local use**; no installation or third-party tools are required.
- Some functions may require **Administrator privileges**.
- The script is **non-destructive**, but always review output when performing actions like disk cleanup or system changes.

---

## Contact

For questions or suggestions, contact **Derek McGuire (coRpSE)** via GitHub or headshotdomain.net.

---


