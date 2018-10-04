-- Title: Moving Images In Lua
-- Name: Brett Shango
-- Course: ICS20/3C
-- This program displays the image of the beetleship  move across the screen

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables  
scrollSpeed = 3

scrollSpeed2 = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png",  450, 400)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the images to be transparent
beetleship.alpha = 0
rocketship.alpha = 1

--set the initial x and y position of beetleship and planet
beetleship.x = 0
beetleship.y = display.contentHeight / 3

rocketship.x = display.contentWidth * 2/3
rocketship.y = 500

--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
    -- change the transparency of the ship every time it so fast that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
----------------------------------------------------------------------------------------------------
end


--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveRocketShip(event)
	-- add the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x - scrollSpeed2
    -- change the transparency of the rocketship every time it moves so fast that it fades out
	rocketship.alpha = rocketship.alpha - 0.00000000000001
end

-- MoveShip and MoveRocketShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
Runtime:addEventListener("enterFrame", MoveRocketShip)