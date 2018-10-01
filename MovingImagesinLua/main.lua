-- Title: Moving Images In Lua
-- Name: Brett Shango
-- Course: ICS20/3C
-- This program displays the image of the beetleship  move across the screen

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables 
scrollspeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect( "Images/background.png" , 2048, 1536)

-- character image with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent 
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this function accepts an event listener 
-- Output: none 
-- Description: This functio adds the scroll speed to the x-value of the ship
local function MoveShip(event)
kkle here