# rmeta - Reset / Rename metadata

For the batch renaming of mp4 and mkv "title" field metadata to match filename.

Many DLNA clients read the metadata of files on a given server and use this data for its organisation of files within a folder. Often this can not be disabled which can result in unexpected playing order.

Solution:  
This script will use mkvpropedit (mkv) and kid3-cli (mp4) to change all .mkv and / or .mp4 files title metadata to match their filename. For episodes of a series if play order is important to you, for maximum compatibility your file names should contain the series and episode numbers.

Example: S01E01.mkv S01E02.mkv S01E03.mkv etc  

This is also helpful in other situations where metadata in the title section becomes confusing. Gone in 60 Seconds (1974).mkv and Gone in 60 Seconds (2000).mkv might have the same metadata of "Gone in 60 Seconds" Using this script to change the metadata would solve this as well, assuming files are appropriately named.

#### Script dependencies:  
[mkvtoolnix](https://mkvtoolnix.download)  
[kid3](https://kid3.kde.org)  

#### Linux:
Usage and installation instructions available on the [wiki.](https://github.com/HarveyDevel/rmeta/wiki/Linux-support)

#### Windows:
While designed with Linux in mind it is possible to use this script in Windows via [WSL.](https://learn.microsoft.com/en-us/windows/wsl/)

Documentation for Windows is available on the [wiki.](https://github.com/HarveyDevel/rmeta/wiki/Windows-support)  
