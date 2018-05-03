# Documentation #

# Movement Logic #
## Zipping ##
1. User uses a dash ability towards a wall  
2. move_state is set to 1, disabling players col  
3. If move_state is still set to 1 and players rea is intersecting with a wall:  
    > -Retain move_state of 1  
    > -Set spec_state to 1  
4. Innitiate a Zip if a player presses a direction on the appropriate axis
5. When a player jumps, exit the zip
6. If player passes through the edge of the screen boundary and spec_state = 1, screen wrap, else transition to the new screen  
