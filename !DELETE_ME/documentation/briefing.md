[Back to README](/README.md#documentation)

## In game briefing

An in game briefing for players to refer back to can make it easier for players to keep track of what is happening in the mission. This can be done using the briefing section of `init.sqf` underneath the radio programming section. 

By default, the briefing is hidden since it only contains placeholder text. To enable it, set the `SHOW_INGAME_BRIEFING` variable to `true`. To hide certain sections of the briefing, leave the section you would like to hide as an empty string:

```sqf
BRIEFING_SITUATION = "Only situation text is displayed.";
BRIEFING_MISSION = "";
BRIEFING_EXECUTION = "";
BRIEFING_ADMIN = "";
```

To easily transfer your standard briefing to in game, simply copy and paste the text in each section into the corresponding `BRIEFING_SITUATION`, `BRIEFING_MISSION`, `BRIEFING_EXECUTION` or `BRIEFING_ADMIN` variable. **Make sure the text is surrounded by double quotes** (`"`). If you want to include double quotes inside the briefing text, you need to convert them to 'double double quotes'. e.g. to include the text `"Just don't get shot" - Ancient TFD proverb`:

```sqf
BRIEFING_SITUATION = "Some text. ""Just don't get shot"" - Ancient TFD proverb";
```

Line breaks/newlines can be added using `<br/>`.

> **NOTE**  
> It can become annoying to scroll along the long line of text in most text editors. If using Visual Studio Code, you can toggle line wrapping using <kbd>ALT</kbd>+<kbd>Z</kbd> or by pressing <kbd>F1</kbd> and searching for 'Toggle Word Wrap' and selecting that action.

These variables can include supported [structured text](https://community.bistudio.com/wiki/Structured_Text). Some extra elements that can be added via structured text include:

- Images
- Marker reference (pans map to marker location when clicked)
- Formatted text such as colours, bold or different fonts
- Links that execute code (use with caution)

e.g.

```sqf
BRIEFING_SITUATION = "Some text.<br/><img image='path\to\image.jpg'/><br/>Some more text.";
BRIEFING_MISSION = "The hostage is being held at the <marker name='farmhouse'>farmhouse</marker>.";
BRIEFING_EXECUTION = "<t color='#FF0000' font='PuristaBold'>Do not engage civilians!</t>";
BRIEFING_ADMIN = "<execute expression='removeWeapon player; hint ""You got scammed!"";'>Click for free ammo!</execute>";
```