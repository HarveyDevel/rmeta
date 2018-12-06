# rmeta - Reset / Rename metadata
Batch renaming of mp4 and mkv "title" field metadata to match filename.

Many DLNA clients read the metadata of files on a given server and use this data for its orginisation of files within a folder.
Often this can not be disabled which can result in unexpected playing order.

Solution:
This script will use mkvpropedit (mkv) and kid3-cli (mp4) to change all .mkv and / or .mp4 files metadata to match their filename.
For episodes of a series, if play order is important to you, for maximum compatibility your files should be named in alphanumeric order.

Example: A1.mkv B2.mkv C3.mkv etc

This is also helpful in other situations where metadata in the title section becomes confusing.
Gone in 60 Seconds (1974).mkv and Gone in 60 Seconds (2000).mkv might have the same metadata of "Gone in 60 Seconds"
Using this script to change the metadata would solve this as well, assuming files are appropriately named.



**Script dependencies:** <br />
mkvpropedit (Part of the mkvtoolnix package)<br />
kid3-cli

**Install** <br />
sudo cp rmeta.sh /usr/bin/rmeta<br />
sudo chmod +x /usr/bin/rmeta<br />


**WARNING** ALL FILES IN THE ACTIVE WORK DIRECTORY WILL BE CHANGED<br />
**Usage** <br />
rmeta<br />
*Follow prompts*
