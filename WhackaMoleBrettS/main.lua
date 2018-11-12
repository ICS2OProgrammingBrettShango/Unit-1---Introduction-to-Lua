-- Title: Whack A Mole 
-- Created by: Brett Shango
-- Course: ICS20/3C
-- This progran places random object on the screen. If the user clicks on it in time
-- the score increases by 1.

local pointsTextObject
local numberPoints = 0

-- Hide the staus Bar
display.setStatusBar(display.HiddenStatusBar)




local backgroundImage = display.newRect(0, 0, display.contentWidth, display.contentHeight )
  

	-- set the background color
    display.setDefault( "background", 67/255, 34/255, 234/255 )


	-- setting position
	backgroundImage.anchorX = 0
	backgroundImage.anchorY = 0
	backgroundImage.x = 0
	backgroundImage.y = 0

	-- creating Mole
	local mole = display.newImage("Images/mole.png" , 0, 0)

	-- setting position 
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY


  
  
  -- shrink the mole size
mole.xScale = 0.3
mole.yScale = 0.5



mole.isVisible = false

-- this function that makes the mole appear in a random (x,y) posisition on the screen 
-- before calling the Hide Fucntion


function PopUp()


	-- choosing the Random Position on the screen between 0 and th size of the screen
	mole.x = math.random(0, display.contentWidth)
	mole.y = math.random(0, display.contentHeight)

	mole.isVisible = true

	Hide()
end

-- this function calls the PopUp fucntion after 3 seconds
function PopUpDelay()
   	timer.peformWithDelay(3000, PopUp )	
end


-- this function makes the mole invisible and then calls the PopUpDelay function
function Hide()

	-- changing visibility 
	mole.isVisible = false
    
    -- call the function
	PopUpDelay()
end

-- this function starts the game 
function GameStart( )
	PopUpDelay()
end

-- this funcion increments the score only if the mole is clicked.It then displays the 
-- new score
function Whacked(event)

	-- if touch phase just stared 
	if(event.phase == "began") then 
	   numberPoints = numberPoints + 1
      pointsTextObject = display.newText("numberPoints = ".. numberPoints, 330, 200, nil, 40 )
      pointsTextObject:setTextColor(3/255, 3/255, 43/255)
	end    
end

-----------------------------------------Event Lisener ----------------
-- I add the event listner to the moles so that if the mole is touched, the whacked function 
-- is called 
mole:addEventListener ("touch" , Whacked )

------------------------------- Start the Game ------------------------------------
GameStart()


	






--------------------------------------------
-- OBJECT CREATION
--------------------------------------------
