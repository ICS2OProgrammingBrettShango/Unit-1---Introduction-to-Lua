-- Title: Lives&Timers
-- Name: Brett Shango
-- Course: ICS20/3C
-- This program allows the user to play a math game with lives and a timer. 
-- For each answer the user gets wrong they will lose a life, or if the run out of time answering the question they will lose a life.



-- variables for the timer 
local totalSeconds = 5
local secondLeft = 5
local clockText 
local countDownTimer

local lives = 3
local heart1
local heart2
local incorrectobject
local pointsObject 
local points

--*** ADD LOCAL VARIABLE FOR: INCORRECT OBJECTS, POINTS OBJECT, POINTS

-----------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------

local function UpdateTime()
	-- decrement the number of seconds 
	secondsLeft = secondsLeft - 1
	-- display the number of the seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then 
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		-- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND, SHOW A YOU LOSE IMAGE 
		-- AND CANCEL THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE 
		if (lives == 2) then 
			heart2.isVisible = false 
		elseif (lives == 1) then 
			heart1.isVisible = false 
	    end


	    -- *** CALL THE FUNCTION TO ASK A NEW QUESTION
    
   end
end

 local function StartTimer()
 	-- create a countdown timer that loops infinitely
 	countDownTimer = timer.performWithDelay( 1000, updateTime, 0)
end


--------------------------------------------------------------------------------------------
-- OBJECT
------------------------------------------------------------------------------------------

-- create the lives to display on the screen
 heart1 = display.newImageRect("Images/heart.png" , 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

local heart2 = display.newImageRect("Images/heart.png" , 100, 100)
heat2.x = display.contenWidh  * 6 / 8
heart2.y = display.contentHeight * 1 / 7



