# TFD Mission Framework
Welcome to the TFD Mission Framework! Please make sure to test any new additions before integrating them into the master branch.

Mission makers, feel free to suggest features/improvements or add scripts you think will benefit the community.

See [CHANGELOG.md](CHANGELOG.md) for update history.

---

## Importing the framework into your mission file
1. Download the latest version of the framework by selecting 'Code > Download ZIP'.

2. Extract the ZIP and copy the contents into your mission folder. You can open your mission folder by selecting 'Scenario > Open Scenario Folder' in the editor's toolbar.  
*NOTE: Delete `CHANGELOG.md` and `!TFD_Compositions` to save mission file size*

3. Configure the framework to your mission. Configuration is done in the files located in the main directory, such as `init.sqf`, `description.ext` and `cba_settings.sqf`, etc.

---

## Setting up TFD editor compositions
Several editor compositions are provided to make setting up common framework systems and basic mission flow easier.

To add them to your editor so you can use them, locate your Arma 3 profile compositions folder in:
    
```
C:\Users\YOURUSER\Documents\Arma 3 - Other Profiles\YOURARMA3PROFILE\compositions\
```

Then copy all of the folders from the `!TFD_Compositions` folder into your compositions folder. 

**If you already have the editor open, you will need to close the editor then re-open it in order to refresh the compositions list.**