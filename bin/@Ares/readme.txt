Current Version: V.0.1.0

Ares is a mod aimed expanding the tools available to Zeus so that it is possible to create more varied and compelling missions. The goal is to add simple useful functionality to Zeus without requiring any extra mods running on other clients or the server.

Ares is designed to work with dedicated servers which may be running missions that allow JIP and respawn. The new functionality it is aimed at running with trusted players in a structured mission and is not recommended for general 'public server' play.

Check out the full feature list and documentation at: https://github.com/astruyk/Ares/wiki
Or check out the source code at: https://github.com/astruyk/Ares

Changelists

V.1.0.1 - Bugfixes
  * Behaviours - Fix issue where 'Aire Artillery' module wouldn't work with units that were spawned by dedicated server
  * Behaviours - Garrisoned units should turn to fire at enemy units now
  * Behaviours - Possible fix for issue where sometimes patrols would set wapoints around [0,0,0] instead of around selected unit
  * Behaviours - Prevent 'Patrol' module from generating waypoints for players
  * Experimental (Reinforcements) - Added some CFB_Skins units to reinforcement pools. Will be tweaked going forward.
  * Experimental (Reinforcements) - Added some RHS units to reinforcement pools. Will be tweaked going forward.
  * General - Fix conficts with some other mods (MCC, AGM)
  * Reinforcements - Possible fix for issue where sometimes reinforcements would spawn at [0,0,0] instead of where module was placed
  * Teleport - Fix issue where creating too many teleporters would cause script errors due to running out of phonetic names
  * Util - Fixed some issues where adding objects to curator would grab ambient objects (rabbits, snakes, etc..)

V.1.0.0 - Public Release!
  * Actions - Fix issue where invisible Zeus sometimes wasn't
  * Arsenal - 'Paste & Replace' works again
  * Behaviours - Added 'Artillery' module to control AI artillery firing.
  * Behaviours - Added 'Patrol' module to automatically generate patrol paths.
  * Behaviours - Fix issue where sometimes un-garrisoned units still wouldn't move
  * Behaviours - Secured units no longer stand back up 90% of the time after finishing 'sit' animation
  * Behaviours - Totally re-wrote 'Search' and 'Search and Garrison' module logic to fix lots of issues.
  * Equipment - Fix issue where only NATO NVG's were being removed with the 'Remove NVG's' module
  * Equipment - Removed NVG's from unit inventory (even if not equipped).
  * Equipment - Replaced laser pointers with flashlights when removing NVG's
  * Extras - Added script to convert copied object positions to composition class format (replaces 'Save For Composition' module)
  * General - Fixed a bunch of RPT spam
  * General - Standardized all 'Choose' dialogs into one common reusable class.
  * General - Totally re-organized all the source files into more sensible hierarchy.
  * Reinforcements - Add new helicopters to reinforcement vehicle pools.
  * Reinforcements - Added new 'Furthest', 'Nearest' and 'Least Used' options to LZ and RP choosing in Reinforcements.
  * Reinforcements - Fixed some issues with helicopters waiting too long at LZ's
  * Reinforcements/Artillery - Persistent modules can now be directly manipulated after creation
  * Save/Load - Added support for pasting back into original position exactly.
  * Save/Load - Fixed a number of issues where stacked objects wouldn't be placed correctly.
  * Save/Load - Fixed issue where ambient objects (fish, chickens, snakes, etc...) were being caputured as well
  * Save/Load - Include version number in copied data (future-proofing)
  * Save/Load - Massive cleanup to fix a number of issues where objects would change positions when pasted in new positions.
  * Teleport - Use 'standard' flagpole for teleporter objects (I still think stone monolith is cooler)
  * Util - Allowed you to choose radius when adding/removing objects from Zeus
  * Experimental - Custom Map Objects - Added preliminary support for allowing maps to add custom objects spawnable through Ares.

V.0.1.1
  * Fixed backgrounds on some UI elements being transparent
  * Reinforcements - Expanded deletion radius of 'Delete LZ/RP' module to 15m (from 5m)
  * Reinforcements - Helicopters no longer wait after unloading troops.
  * Reinforcements - Units don't wait as long before deleting themselves.

V.0.1.0 - BETA!
  * Add 'Reinforcements' module. 
  * Fix backpacks not being removed when clearing inventory for Arsenal
  * Fix pasting not working in MP (Affected Save/Load as well as Arsenal functions)
  * Added the ability to paste saved objects into their original objects (instead of just relative to the cursor)
  * Fixed issue where zeus teleporting himself would show the 'You are being teleported' message (was redundant)
  * Added module to 'Save/Load' for Zeus to add all objects in the map to curator
  * Added ability to teleport a group

V.0.0.2
	* Added Arsenal functions

V.0.0.1
	* Initial alpha release.