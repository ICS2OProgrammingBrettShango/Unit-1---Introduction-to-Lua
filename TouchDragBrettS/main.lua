-- Title: TouchAndDrag
-- Name: Brett Shango
-- Course: ICS20/3C
-- This program displays images that react to a person’s finger.

--hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- local variables. I am stil trying to get the x-value to be set poperly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local star = display.newImageRect("Images/star.png", 150, 150)
local planet = display.newImageRect("Images/planet.png", 150, 150)

-- my boolean variables to keep track of which object I touched first 
local alreadyTouchedstar = false
local alreadyTouchedplanet = false

--set the initial x and y position of myImage 
star.x = 400
star.y = 500

planet.x = 300
planet.y = 200

-- Function: planetListner, starListener
-- Input: touch listener
-- output: none
-- Description: when star is touched, move her
local function planetListener(touch)

   if (touch.phase == "began") then
 	   if (alreadyTouchedstar == false) then
 		   alreadyTouchedplanet = true 
       end
    end

    if ( (touch.phase == "moved") and (alreadyTouchedplanet == true) ) then
    	planet.x = touch.x
    	planet.y = touch.y

        
    end

    if (touch.phase == "ended") then
        alreadyTouchedplanet = false
        alreadyTouchedstar = true

        
    end
end

local function starListener(touch)

   if (touch.phase == "began") then
       if (alreadyTouchedplanet == false) then
           alreadyTouchedstar = true 
       end
    end

    if ( (touch.phase == "moved") and (alreadyTouchedstar == true) ) then
        star.x = touch.x
        star.y = touch.y
    end

    if (touch.phase == "ended") then
        alreadyTouchedplanet = false
        alreadyTouchedstar = false
    end
end

-- add the respective listeners to each object
planet:addEventListener("touch", planetListener)
star:addEventListener("touch", starListener)

