local icemaker = {name = "Ice maker time estimate"}


function icemaker:load(data)
    self.settingRange = false
    self.timePerTub = 1050 -- In seconds
    self.mainLayout = {
        {"7", "8", "9"},
        {"4", "5", "6"},
        {"1", "2", "3"},
        {"<", "0", "ok"},
        {"back"}
    }
    self.mainKeypad = keypad.new(self.mainLayout, 0, safe.y + displayHeight, lg.getWidth(), safe.height - displayHeight, self.keyPadInput)
    self.mainKeypad:setRowSetting(5, "height", 0.5)
    self.mainKeypad:updateLayout()
    
    self.mainKeypad:addKeyFunction("back", function() state:setState("calculator") end)
    self.mainKeypad:addKeyFunction("ok", self.ok) 

    display:clear()
    calculator:clear()
    display:setTip("Enter tubs left")
end

function icemaker.ok()
    local self = icemaker
    local currentTime = os.time()
    local timeLeft = self.timePerTub * display:read()
    local finishTime = os.date("%H:%M", currentTime + timeLeft)

    local minutes = math.floor(timeLeft / 60)
    local hours = 0
    if minutes > 59 then
        hours = math.floor(minutes / 60)
        minutes = minutes - (hours * 60)
    end

    local text = minutes.." minutes"
    if hours == 1 then
        text = hours.." hour and "..minutes.." minutes"
    elseif hours > 1 then
        text = hours.." hours and "..minutes.." minutes"
    end

    display:clear()
    calculator:clear()
    display:setTip("Estimated finish time: "..finishTime.."\nAfter "..text)
end

function icemaker.keyPadInput(key)
    calculator:input(key)
end

function icemaker:update(dt)
    self.mainKeypad:update(dt)
end

function icemaker:draw()
    self.mainKeypad:draw()
end

function icemaker:mousepressed(x, y, k)
    self.mainKeypad:input(x, y)
end

return icemaker
