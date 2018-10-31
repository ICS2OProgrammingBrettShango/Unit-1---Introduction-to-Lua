-- Title: Interacting Objects 2
-- Name: Brett Shango
--  Course: ICS20/3c
-- This programms display beams, and balls and makes thme bounce and collide at one another.
------------------------------------------------------------------------------------------- Hide Status Bar

display.setStatusBar(display.HiddenStatusBar)

--load physics
local physics = require("physics")

--start physics
physics.start()
-------------------------------------------------------------------
--Objects
-------------------------------------------------------------------
--Ground
local ground = display.newImage("Images/ground.png", 0, 740)

-- change the width of the ground, for it to be the same as the screen
ground.width = display.contentWidth
ground.x = display.contentWidth/2

-- add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-- Groun
local ground2 = display.newImage("Images/ground.png", 0, 70)

-- change the width of the ground, for it to be the same as the screen
ground2.width = display.contentWidth
ground2.x = display.contentHeight/1.25

-- add to physics
physics.addBody(ground2, "static", {friction=0.5, bounce=0.3})
---------------------------------------------------------------------
local beam = display.newImage("Images/beam.png", 0, 0)
beam.width = display.contentWidth/2
beam.height = display.contentHeight*1/9


--set the x and y pos
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

--rotate the bame -60 degrees so its on an angle 
beam:rotate(44)

--send it to the back layer
beam:toBack()

--add tophysics 
physics.addBody(beam, "static", { friction=0.5, bounce=0.3})
----------------------------------------------------------

local beam_long = display.newImage("Images/beam_long.png", 0, 0)
beam_long.width = display.contentWidth/2
beam_long.height = display.contentHeight*1/9

-- set the x and y pos
beam_long.x = 100
beam_long.y = 300

--rotate beam 2 -60 degrees so its on an angle 
beam_long:rotate(40)

--send it to the back layer
beam_long:toBack()

--add t0 physics 
physics.addBody(beam_long, "static", { friction=0.5, bounce=0.3})


local beam_long2 = display.newImage("Images/beam_long.png", 0, 100)
beam_long2.width = display.contentWidth/2
beam_long2.height = display.contentHeight*1/10

-- set the x and y pos
beam_long2.x =  950
beam_long2.y = display.contentHeight/1.8

--rotate beam 2 -60 degrees so its on an angle 
beam_long2:rotate(90)

--send it to the back layer
beam_long2:toBack()

--add t0 physics 
physics.addBody(beam_long2, "static", { friction=0.5, bounce=0.3})


----------------------------------------------------------
--create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)

	--set the x and the y pos
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	--send to back
	bkg:toBack()

	-----------------------------------------------------------
	--FUNCTIONS
	-----------------------------------------------------------

--create the first ball
local function firstBall()
		-- creating first ball
		local ball1 = display.newImage("Images/super_ball.png", 0, 0)
		--add to physics
	 	physics.addBody(ball1, {density= 1.0, friction=0.5, bounce=1, radius= 25})
	end
	------------------------------------------------------------------------------------------------------------

	--create the second ball
	local function secondBall()
		-- creating second ball
		local ball2 = display.newImage("Images/super_ball.png", 0, 0)
		--add to physics
		physics.addBody(ball2, {density=1,0, friction=0.5, bounce=0.5, radius=12.5})
		ball2:scale(0.5, 0.5)
	end
	-------------------------------------------------------------------------------------------------------------
	--create the third ball
	local function thirdBall()
		-- creating second ball
		local ball3 = display.newImage("Images/super_ball.png", 0, 0)
		ball3:scale(2, 2)
	
		--add to physics
		physics.addBody(ball3, {density=1.7, friction=5.5, bounce=1, radius=50})
	end
	--------------------------------------------------------------------------------------------------------------
	--create the fourth ball
	local function fourthBall()
		-- creating second ball
		local ball4 = display.newImage("Images/super_ball.png", 0, 0)
		ball4:scale(4, 4)
	
		--add to physics
		physics.addBody(ball4, {density=1,0, friction=0.8, bounce=0.5, radius=100})
	end
	--------------------------------------------------------------------------------------------------------------
-----------------------------------
	--TIMER DELAYS - CALL EACH FUNCTION AFTER THE GIVEN MILLISECOND
	---------------------------------------------------------------
	timer.performWithDelay(0, firstBall)
	timer.performWithDelay(500, secondBall)
	timer.performWithDelay(1000, thirdBall)
	timer.performWithDelay(1500, thirdBall)


