[Back to README](/README.md#documentation)

## Team colour assignment

Team colours can be pre-assigned to specific slots using the team assignment section of `init.sqf`. This should be located just below the TFD ORBAT. **The TFD ORBAT must be set up for this to work.** To assign a slot to a colour, simply place the name of that slot into the `TFD_RED_TEAM`, `TFD_BLUE_TEAM`, `TFD_YELLOW_TEAM` or `TFD_GREEN_TEAM` lists. e.g. to assign `s_1` and `s_2` to team red and `s_3` and `s_4` to team blue:

```sqf
TFD_RED_TEAM = ["s_1", "s_2"];
TFD_BLUE_TEAM = ["s_3", "s_4"];
TFD_YELLOW_TEAM = [];
TFD_GREEN_TEAM = [];
```

> **NOTE**  
> An easy way to do this quickly is to select all the units you want to assign to a particular team in the editor, right click on one and select `Log > Log Variable Names to Clipboard`. You can then paste the result inside the square brackets.