# rmeta - Reset / Rename metadata
For the batch renaming of mp4 and mkv "title" field metadata to match filename.

Many DLNA clients read the metadata of files on a given server and use this data for its organisation of files within a folder. Often this can not be disabled which can result in unexpected playing order.

Solution:  
This script will use mkvpropedit (mkv) and kid3-cli (mp4) to change all .mkv and / or .mp4 files title metadata to match their filename. For episodes of a series, if play order is important to you, for maximum compatibility your files should be named in alphanumeric order.

Example: A1.mkv B2.mkv C3.mkv etc

This is also helpful in other situations where metadata in the title section becomes confusing. Gone in 60 Seconds (1974).mkv and Gone in 60 Seconds (2000).mkv might have the same metadata of "Gone in 60 Seconds" Using this script to change the metadata would solve this as well, assuming files are appropriately named.

#### Script dependencies:  
[mkvtoolnix](https://mkvtoolnix.download)  
[kid3](https://kid3.kde.org)  

#### Install:  
sudo cp rmeta.sh /usr/bin/rmeta  
sudo chmod +x /usr/bin/rmeta  

#### Usage  
Please note this script will modify the metadata for ALL files in the active directory.

[command] [argument]  
For mkv files:  
rmeta mkv  

For mp4 files:  
rmeta mp4  

For both mkv and mp4 files:  
rmeta all  
