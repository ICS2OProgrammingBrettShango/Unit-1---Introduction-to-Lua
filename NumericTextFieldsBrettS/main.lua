-- Title: Numeric TextField
-- Name: Brett Shango
-- Course: ICS20/3C
-- This program displays a math question and asks the user to answer in a numeric textfield.
-------------------------------------------------------------------------------------------------------


-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 124/255, 249/255, 199/255)

-----------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
----------------------------------------------------------------------------------------------------------

-- create local variables 
local questionObject

local correctObject
local incorrectObject
local numericField 

local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local randomOperator
local wrongObject
local pointsTextObject
local numberPoints = 0
local correctSound
local correctSoundChannel 
local incorrectSound
local incorrectSoundChannel 
local numberLives = 4

-- variables for the timer 
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 4
local heart1
local heart2 
local heart3
local heart4



-------------------------------------------------------------------------------------------------
-- SOUNDS
------------------------------------------------------------------------------------------------------

-- Correct Sound 
local correctSound = audio.loadSound ("Sounds/correctSound.mp3" ) -- setting a variable to an mp3 file
local correctSoundChannel

-- Wrong Sound 
local incorrectSound = audio.loadSound ( "Sounds/incorrectSound.mp3") -- setting a variable to an mp3 file
local incorrectSoundChannel

------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------------------------

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
		if (lives == 4) then 
			heart4.isVisible = false 
		elseif (lives == 3) then 
			heart3.isVisible = false
		elseif (lives == 2) then
			heart2.isVisble = false
		elseif(lives == 1) then
			heart1.isVisible = false
	    end


	    -- *** CALL THE FUNCTION TO ASK A NEW QUESTION
    
   end
end


-- function that calls the timer
 local function StartTimer()
 	-- create a countdown timer that loops infinitely
end
 	countDownTimer = timer.performWithDelay( 1000, updateTime, 0)


 
local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(1,3)
	randomNumber1 = math.random(1,10)
	randomNumber2 = math.random(1,10)

 
 	if (randomOperator == 1) then
 		correctAnswer = randomNumber1 + randomNumber2
	
		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
	 	correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	elseif (randomOperator == 3) then
	 	correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = " 


	end	

end

local function HideCorrect()
	correctObject.isVisible = false 
	AskQuestion()
end

local function HideinCorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event ) 

    -- User beging editing "numericfield"
	if ( event.phase == "began" ) then

		-- clear text field 
		event.target.text = "" 

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input bto user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true 
			event.target.text = ""
			correctObject.isVisible = false
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2000,HideCorrect)
			numberPoints = numberPoints + 1
			event.target.text = "" 

       -- add additional amount of points for every answer you did right in the text object
			 pointsTextObject.text = "Points = ".. numberPoints
			
			--remove 1 point for every answer the user gets wron in the text object
             livesTextObject.text = "Lives = "  .. numberLives

		else 
			correctObject.isVisible = false 
			incorrectObject.isVisible = true
		    incorrectSoundChannel = audio.play(incorrectSound)
			timer.performWithDelay(2000,HideinCorrect)
		    lives = lives - 1

		end    
    end
end 

    


-----------------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------------------------------------
-- create images of the lives to display on the screen
heart1 = display.newImageRect("images heart/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images heart/heart.png" ,100, 100)
heart2.x = display.contentWidth  * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images heart/heart.png" , 100, 100)
heart3.x = display.contentWidth * 4 / 8
heart3.y = display.contentHeight * 1/ 7

heart4 = display.newImageRect("Images heart/heart.png", 100, 100)
heart4.x = display.contentWidth * 5/ 8
heart4.y = display.contentHeight * 1 / 7

gameOver = display.newImageRect(" Images/gameOver.png", 200, 200)

-- create a points box and make the point box visible to see.
pointsTextObject = display.newText("numberPoints = ".. numberPoints, 330, 200, nil, 40 )
pointsTextObject:setTextColor(3/255, 3/255, 43/255) 

--create a lives box and make the lives box visible to see
livesTextObject = display.newText("numberLives = ".. numberLives, 500, 700, nil, 40 )
livesTextObject:setTextColor(3/255, 3/255, 43/255) 

-- displays a question and sets the colour 
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50 ) 
questionObject:setTextColor(155/255, 42/255, 198/255)


-- create the correct text object and make it invisible 
correctObject = display.newText( "All Right!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

-- create the incorrect  text object and make it invisible
incorrectObject = display.newText("Yikes,incorrect!", display.contentWidth/2, 250, nil, 50)
incorrectObject:setTextColor(2/255, 124/255, 134/255)
incorrectObject.isVisible = false


-- Create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "default"


-- add the event listener for the points and  numeric Field 
numericField:addEventListener( "userInput", NumericFieldListener )



-------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
-------------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

NumericFieldListener()

UpdateTime()

StarTime()


