-- game map assets
local background = display.newImageRect("SkyBG1.png", display.contentWidth, display.contentHeight)
background.x = display.contentCenterX
background.y = display.contentCenterY

local floor = display.newImageRect("Grass2.png", display.contentWidth,64)
floor.x = display.contentCenterX
floor.y = display.contentHeight-15

local platformSmall = display.newImageRect("grassPlatform2.png", 74,24)
platformSmall.x = display.contentCenterX-200
platformSmall.y = display.contentCenterY+37

local platformSmall2 = display.newImageRect("grassPlatform.png", 74,24)
platformSmall2.x = display.contentCenterX-66
platformSmall2.y = display.contentCenterY-44

local platformSmall3 = display.newImageRect("grassPlatform.png", 74,24)
platformSmall3.x = display.contentCenterX+66
platformSmall3.y = display.contentCenterY-44

local platformSmall4 = display.newImageRect("grassPlatform.png", 74,24)
platformSmall4.x = display.contentCenterX+200
platformSmall4.y = display.contentCenterY+37

--movements options
local idleOptions = {
	width = 100, 
	height = 59,
	numFrames = 3,
}

local runOptions = {
width = 100,
height = 100,
numFrames = 6,
}

--sequence Data
local idleSequenceData = {
	name = "idle",
	start = 1,
	count = 8,
	time = 1500,
}
local runSequenceData = {
		name = "run",
		start = 1,
		count = 8,
		time = 1500,	
}

--local character = display.newImage("Rogue.png", display.contentCenterX, display.contentCenterY)
--character init
local characterIdleSheet = graphics.newImageSheet("RogueLikeIdle.png", idleOptions)
local characterRunSheet = graphics.newImageSheet ("rogue like run.png", runOptions)


--local runAnimation = display.newSprite(characterRunSheet, runSequenceData)
local idleAnimation = display.newSprite(characterIdleSheet, idleSequenceData)
idleAnimation.x = display.contentWidth/2
idleAnimation.y = display.contentHeight/2
idleAnimation:play()


--physics init
local physics = require("physics")
physics.start()

physics.addBody(idleAnimation)
physics.addBody(floor, "static")
physics.addBody(platformSmall, "static")
physics.addBody(platformSmall2, "static")
physics.addBody(platformSmall3, "static")
physics.addBody(platformSmall4, "static")

local function onTouch(event)
	if(event.phase == "ended") then
		idleAnimation:setSequence(runSequenceData)
		idleAnimation:play()
		transition.to(idleAnimation, {x=event.x, y=event.y})
	-- body
	end
end

Runtime:addEventListener("touch", onTouch)