[Back to README](/README.md#documentation)

## Civilian casualty punishments

By default there are no repercussions for players killing civilians. If desired, harsher punishments including mission fail conditions or kicking players can be added for civilian deaths. These can be configured in the punish civilian deaths section underneath the fuel consumption settings.

To enable civilian casualty punishments, change the `ENABLE_PUNISH_CIVS` variable to `true`.

By default, without changing any of the other settings this will simply show which player killed a civilian in the game chat where every player on the server can see it. This can be turned on and off by changing the `PUNISH_CIVS_ANNOUNCE_DEATHS` variable to `true` or `false` respectively.

There are 3 other settings which can configure the type and severity of the punishment: `PUNISH_CIVS_KILL_LIMIT`, `PUNISH_CIVS_KICK_PLAYERS` and `PUNISH_CIVS_KILLS_TO_KICK`. 

If more than `PUNISH_CIVS_KILL_LIMIT` civilians are killed, the mission will immediately fail. A value of `-1` disables the limit.

If `PUNISH_CIVS_KICK_PLAYERS` is set to `true`, a player can be kicked back to the mission lobby with a warning if they kill `PUNISH_CIVS_KILLS_TO_KICK` or more civilians.

> [!NOTE]  
> Some units may be considered civilian by the game that are not actually civilian units, such as units that are handcuffed or hostages. Be careful with how you configure your settings to ensure that players are not unfairly punished.