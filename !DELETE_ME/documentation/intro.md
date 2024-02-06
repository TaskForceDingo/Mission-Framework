[Back to README](/README.md#documentation)

## Intro scene/drone shot

A mission intro can help set the scene for your mission. The TFD mission intro can be configured in the intro section of `init.sqf`, directly underneath the briefing section.

By default, the intro is disabled and can be enabled by setting the `ENABLE_INTRO` variable to `true`. There is also a summary hint that is enabled by default that will pop up after the intro is completed. This shows a summary of what radio programming has been applied to the player and who their squad leader and the commander are. This can be disabled if desired by setting `ENABLE_SUMMARY_HINT` to `false`.

The type of intro is selected using the `INTRO_USE_CAMERA_PAN` variable. There are two types of intros available:

- 'Establishing Shot' UAV intro - Camera orbit around a fixed point with UAV style overlay
- 'Camera Pan' - Scripted cinematic with camera moving between sets of fixed points

The default intro is the vanilla establishing shot, to instead use the cinematic camera pan intro set `INTRO_USE_CAMERA_PAN` to `true`.

The `INTRO_MISSION_INFO` array contains the mission name and author displayed during the intro. In the establishing shot, this will displayed in the bottom right corner after the intro is completed while in the cinematic intro this will be displayed after a set delay.

> [!NOTE]  
> The configuration for both the establishing shot and cinematic intro are included in `init.sqf`, but only one will be used. There is no need to modify the configuration of the intro type you are not using.
> 
> You can safely delete the unused intro configuration section if you want to.

### Establishing Shot
To configure the settings for the establishing shot, modify the `INTRO_ESTABLISHING_SHOT_PARAMS` array. The following configuration will make the camera orbit the marker named `intro_marker` at an altitude of 100m and radius of 80m and display the text 'FOB Hammer' with NVG mode enabled. The last number is the point of the orbit that the camera starts at.

```sqf
INTRO_ESTABLISHING_SHOT_PARAMS = [
    "intro_marker", "FOB Hammer",
    100, 80, 0, // _altitude, _radius, _startingAngle
    true // NVG view mode
];
```

### Cinematic Intro
The cinematic intro can be configured using the `INTRO_CAMERA_PAN_TEXT_DELAY`, `INTRO_CAMERA_PAN_TEXT_DURATION` and `INTRO_CAMERA_PAN_PARAMS` variables underneath the configuration for establishing shot.

- `INTRO_CAMERA_PAN_TEXT_DELAY` controls the delay in seconds between the start of the cinematic and when the mission name and author are displayed.
- `INTRO_CAMERA_PAN_TEXT_DURATION` controls the duration in seconds the mission name and author are displayed for before disappearing.

`INTRO_CAMERA_PAN_PARAMS` controls the camera positions in each pan. The default configuration consists of only a single pan with a target position and a sound effect that is played:

```sqf
INTRO_CAMERA_PAN_PARAMS = [
    [
        [0,0,0],                // _target (where the camera is pointing)
        [0,0,0], [0,0,0], 20,   // _startPos, _endPos, _duration
        "tfd_intro_2"           // _sound ("" for none)
    ]
];
```

There are several ways to obtain the positions required to configure the cinematic how you would like. An easy way is to place objects down in the editor, assign them variable names and make them invisible. You can then use the object positions instead of coordinates:

```sqf
INTRO_CAMERA_PAN_PARAMS = [
    [
        position myCamTarget, 
        position myCamStart, position myCamEnd, 20, 
        "tfd_intro_2" 
    ]
];
```

Another way is to play the scenario and enter the camera mode (open the pause menu and select 'Camera'), move the camera to the position you want and press <kbd>CTRL</kbd> + <kbd>C</kbd>. This will copy the camera settings to your clipboard. This will give you an array that looks like this:

```sqf
["Stratis",[1793.42,6018.59,8.07949],188.623,0.75,[-29.0339,0],0,0,720.021,0.3,0,1,0,1]
```
The second item in the array is the camera position, so in this case you can obtain the position by copying `[1793.42,6018.59,8.07949]`.

If you wish to add multiple pans to the cinematic (e.g. position A to B, then position C to D), you can add them by copying the nested array inside the `INTRO_CAMERA_PAN_PARAMS` variable:

```sqf
INTRO_CAMERA_PAN_PARAMS = [
    [
        position pan1Target, 
        position pan1Start, position pan1End, 20, 
        "tfd_intro_2" 
    ],
    [
        position pan2Target, 
        position pan2Start, position pan2End, 20, 
        "" // we don't want the intro music to play again
    ]
];
```

> [!WARNING]  
> Pay close attention to the brackets and commas in this example. A comma must be put after each item in an array except for the last. This variable uses multi layered arrays so the arrays themselves are also items in an array. If you get errors, check that all of the brackets and commas are correctly placed. 
> 
> If you are using VSCode with the recommended extensions, these issues should be easy to spot as mismatching bracket pairs will be red and missing commas will produce red highlights.