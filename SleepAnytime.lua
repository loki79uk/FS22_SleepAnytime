-- ============================================================= --
-- SLEEP ANYTIME MOD
-- ============================================================= --
SleepAnytime = {};

addModEventListener(SleepAnytime);

function SleepAnytime:sleepDialogUpdateOptions(superFunc)
	self.targetTimes = {}
	
	local currentTime = g_currentMission.environment.dayTime / 3600000
	local currentHour = math.floor(currentTime)
	
	for i = SleepDialog.MIN_TARGET_TIME, 23 do
		table.insert(self.targetTimes, string.format("%02d:%02d", i, 0))
	end
	for i = 0, SleepDialog.MIN_TARGET_TIME do
		table.insert(self.targetTimes, string.format("%02d:%02d", i, 0))
	end

	self.targetTimeElement:setTexts(self.targetTimes)
	self.targetTimeElement:setState(self.selectedTargetTime - SleepDialog.MIN_TARGET_TIME + 1)
	
end

function SleepAnytime:loadMap(name)
	print("Load Mod: 'Sleep Anytime'")
	SleepDialog.updateOptions = Utils.overwrittenFunction(SleepDialog.updateOptions, SleepAnytime.sleepDialogUpdateOptions)
	
	self.initialised = false
end

function SleepAnytime:deleteMap()
end

function SleepAnytime:mouseEvent(posX, posY, isDown, isUp, button)
end

function SleepAnytime:keyEvent(unicode, sym, modifier, isDown)
end

function SleepAnytime:draw()
end

function SleepAnytime:update(dt)
	if not self.initialised then

		self.initialised = true
	end
end