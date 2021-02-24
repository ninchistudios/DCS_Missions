Through The Inferno (Dynamic DCS) by deadlyfishes is an endless, dynamic, and open-world PvE experience for DCS World.
All modern aircraft, both fixed and rotary wing are available with a dynamic mission spawning and tasking menu.
Use your COMMUNICATIONS MENU button to find the tasking menus. (Usually bound to your \ key ).

#######################################################################

Tips for running a private co-op server, adding more slots or adding AI wingmen.

To make more slots of an aircraft type, just add more planes to the client/player slots which have 1 of 1 plane in the squadron. Simply increase the second number up to 4 max to have more slots.
If you need more, you can copy and paste a slot as many times as you'd like.

To COPY and PASTE a playable slot, select an aircraft slot by clicking on it once to make it YELLOW.
Hit CTRL + C to copy and then hit CTRL + V to paste it.

For new helicopters to work with CTLD, ensure their PILOT NAME has "Helo" anywhere in the name. "HELO-1" and "Helo-Unit" are both acceptable examples.

If you want AI wingmen, add more planes to the squadron of the slot you want to use, and MAKE SURE THEIR DIFFICULTY IS SET TO ANYTHING EXCEPT FOR PLAYER or CLIENT. 

_______________________________________________________________

Take note of the MISSION OPTIONS (Checkmark box on left side of the editor)
It'd be a good idea to make sure you change the options you want; No labels, no enemies on F10 map, etc...

_______________________________________________________________


You don't own the Super Carrier Module? Change it back to the CVN-74 John C. Stennis unit!

- Open the MISSION EDITOR
- Open the MISSION FILE
- FIND the Carrier UNIT on the MAP labeled as "CVN-7X"
- CHANGE the TYPE to "CVN-74 John C. Stennis"
- SAVE THE MISSION!

For the Kuznetsov, "CV 1143.5 Admiral Kuznetsov(2017)" to "CV 1143.5 Admiral Kuznetsov"

Open and play the mission as you would normally.

_______________________________________________________________

WANT TO MOVE MISSION ZONES TO OTHER LOCATIONS?
EASY! You can do that! Just make sure to move the waypoints with them so that the WPT number text will reflect the correct location of your zone. The intel text with coordinates and GRID will adjust automatically, but the waypoints will not.


_______________________________________________________________

Do you not like the HAND DRAWN MISSION ZONE BOUNDRIES?
Easy fix, if you can manage extracting the lua file.

- Open Miz with 7zip, find the Ground Missions.lua file
- Extract it
- open it for edit
- remove all the lines that define the zone polygons; lines 164 - 195
- REPLACE with CTRL H "poly_" with nothing, so that all "poly_" is essentially deleted
- SAVE
- Put back in MIZ where it was extracted from.
Now the missions will spawn inside the zone circles as they did before.

#######################################################################


Official Through The Inferno website:
http://www.throughtheinferno.com

ED Forum Information and Support Forum Post:
https://forums.eagle.ru/showthread.php?t=175802

Join our Through The Inferno Multiplayer Community Discord:
https://discord.gg/BRF2pcN

Airboss Script Documentation and Information:
https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Ops.Airboss.html