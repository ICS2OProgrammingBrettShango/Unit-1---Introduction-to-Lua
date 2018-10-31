-- Title: Whack A Mole 
-- Created by: Brett Shango
-- Course: ICS20/3C
-- This progran places random object on the screen. If the user clicks on it in time
-- the score increases by 1.



-- Hide the staus Bar
display.setStatusBar(display.HiddenStatusBar)


-- set the background color
display.setDefault( "background", 67/255, 34/255, 234/255 )


-- This is the image I will be using.
local Naruto = display.newImageRect("Naruto.png", 500, 500)

-- change the width of the ground, for it to be the same as the screen
naruto.width = display.contentWidth
naruto.x = display.contentWidth/2