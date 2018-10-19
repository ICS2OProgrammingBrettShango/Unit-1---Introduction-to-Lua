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
local numericField 
local wrongObject
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local wrongAnswer
local randomOperator
local wrongObject
local pointsTextObject
local numberPoints = 0


------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------------------------
 
local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(0,3)
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


local function NumericFieldListener( event ) 

--User beging editing "numericfield"
	if ( event.phase == "began" ) then

		--clear text field 
		event.target.text = "" 

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input bto user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true 
			event.target.text = ""
			incorrectObject.isVisible = false
			timer.performWithDelay(2000,HideCorrect)
			numberPoints = numberPoints + 1

			event.target.text = "" 

       -- add additional amount of points for every answer you did right in the text object
			 pointsTextObject.text = "Points = ".. numberPoints

		else 
			correctObject.isVisible = false 
			incorrectObject.isVisible = true
			timer.performWithDelay(2000,HideinCorrect)
			numberPoints = numberPoints - 1

	     

         end        
    end
end 

-- create a points box and make the point box visible to see.
pointsTextObject = display.newText("numberPoints = ".. numberPoints, 330, 200, nil, 40 )
pointsTextObject:setTextColor(3/255, 3/255, 43/255) 


--------------------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------------------------------------------------------

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
numericField.inputType = "number"


-- add the event listener for the points and  numeric Field 
numericField:addEventListener( "userInput", NumericFieldListener )



-------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
-------------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()







 
