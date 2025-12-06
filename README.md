# GetPurviewConfig

**GitHub:** `miilosz2000`

**Created:** `5th December 2025`

**Purpose:** This repository is intended to get and manage configuration for Microsoft Purview (formerly Azure Purview). It provides tools and scripts to retrieve, store, and manage Purview configuration items such as scan rules, classifications, sources, and role-based access control (RBAC) settings. Use this project to automate backing up, auditing, or applying consistent configuration across Purview instances.


**Requirements before you get started**: 
- You must have a corporate Microsoft tenant, not a personal. If you have a personal, sync it to the organisational one.
- Powershell should be latest version, install ExchangeOnlineManagement with administrator. Ensure it is saved to the default location (Program File/WindowsPowerShell/Modules). IF the location isn't where the package installed, copy it into this location).
- Purview tenant is created and functional. Compliance Administrator is the recommended role to complete the Gather and sync.
