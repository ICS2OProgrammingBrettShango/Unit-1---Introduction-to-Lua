-- Title: TouchAndDrag
-- Name: Brett Shango
-- Course: ICS20/3C
-- This program displays images that react to a person’s finger.

--hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- local variables. I am stil trying to get the x-value to be set poperly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local yellowGirl = display.newImageRect("Images/yellowGirl.png", 150, 150)
local yellowGirlWidth = yellowGirl.width 
local yellowGirlHeight = yellowGirl.height 

local blueGirl = display.newImageRect("Images/blueGirl.png", 150, 150)
local blueGirlWidth = blueGirl.width 
local blueGirlHeight = blueGirl.height 

-- my boolean variables to keep track of which object I touched first 
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false

--set the initial x and y position of myImage 
yellowGirl.x = 400
yellowGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

-- Function: BlueGirlListner
-- Input: touch listener
-- output: none
-- Description: when blue girl is touched, move her
local function blueGirlListener(touch)

   if (touch.phase == "began") then
 	   if (alreadyTouchedYellowGirl == false) then
 		   alreadyTouchedBlueGirl = true 
       end
    end

    if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
    	blueGirl.x = touch.x
    	blueGirl.y = touch.y
    end

    if (touch.phase == "ended") then
        alreadyTouchedBlueGirl = false
        alreadyTouchedYellowGirl = false
    end
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch", blueGirlListener)


   