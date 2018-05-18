# Documentation #

## Style/Themes ##
*Possibly an eldritch horror style metroidvania, but a little cuter*

## Dev Notes ##
There are a few 'rules' in the code base that should be followed to make sure that things stay organized:
### To Do: ###
* Add camera shift triggers to rooms
* Write a system to make camera follow a track 
### Naming Conventions ###  
* Functions are written in fat snake case eg. Global.gd/Change_Prop  
  
* Constants or variables that are not meant to be changed directly are written in all caps snake case eg. Global.gd/props.move_state.INTANG  
  
* Normal more 'fluid' variables are in all lower case snake case eg.Movement.gd/motion    
  
## Combat ##
### Offense ###
#### Sickle ####
* The first of the players 2 basic attacks is a slash with the sickle *
* An enemy is targeted, bring up the sickle attack QTE
* A pattern is shown to the player in a square and they take control of a cursor
* moving the cursor along the points ofthe pattern will add to the attacks damage
* based on the weapon, there is a chance for status effect icons to show up on the points in the pattern, tracing over these will add status effects (poison, bleed etc)
* Sickle basic attacks will generally deal slashing damage

#### Bombs ####
* The second basic attack is throwing a bomb
* An indicator will show that a bomb QTE has began
* The player will control the arc/height of the bomb, pressing confirm to throw it
* the bomb will be thrown along the indicated path
* pressing confirm again will detonate the bomb, damaging enemies based on their proximity to the detonation point


## Item progression ##
1.Bombs (blowing up obstacles)
3. Double Jump
3. Sickle upgrade I (allowing for using the sickle to swing on hooks)
4.Bomb Upgrade I (Bombs can now be used to automatically escape from combat, costing some amount of health)
5. A dash
6. Some kind of ground pound, used to push in large switches
7. Sickle Upgrade II (used to climb most walls)
8. Bomb Upgrade II (Blowing up sturdy obstacles)
9. Swimming/Diving ability

## Movement Logic ##
### Zipping ###
1. User uses a dash ability towards a wall  
2. move_state is set to 1, disabling players col  
3. If move_state is still set to 1 and players rea is intersecting with a wall:  
    > -Retain move_state of 1  
    > -Set spec_state to 1  
4. Innitiate a Zip if a player presses a direction on the appropriate axis
5. When a player jumps, exit the zip
6. If player passes through the edge of the screen boundary and spec_state = 1, screen wrap, else transition to the new screen  
