local settings = {name = "Select Theme"}

function settings:loadKeypad()
    self.set_vibration = false
    self.set_display = false

    self.mainLayout = {}
    for i,v in ipairs(themes) do
        self.mainLayout[i] = {v.name}
    end
    self.mainLayout[#self.mainLayout + 1] = {"Back"}

    self.mainKeypad = keypad.new(self.mainLayout, safe.x, safe.y + displayHeight, safe.width, safe.height - displayHeight, self.keyPadInput)
    self.mainKeypad:setSpecial("Back")
    self.mainKeypad:setRowSetting(#self.mainLayout, "height", 2)
    self.mainKeypad:updateLayout()

    self.mainKeypad:addKeyFunction("Back", function()
        state:setState("settings")
    end)

    self.keypad = self.mainKeypad
    display:print("Settings")
end

function settings:load(data)
    data = data or ""


    self.presses = 0
    self.lastKey = ""
    self:loadKeypad()
    calculator:setFormula(data)
    self.clearHistory = false
    self.selectTheme = false
    self.toggle_vibration = false
    self.total_formula = ""
end

function settings.keyPadInput(key)
    self = settings

    for i,v in ipairs(themes) do
        if v.name == key then
            setTheme(i)
            break
        end
    end

    self.lastKey = key
end

function settings:update(dt)
    self.keypad:update(dt)
end

function settings:draw()
    self.keypad:draw()


    --lg.setColor(0, 1, 1, 1)
    --lg.print(tostring(self.selectTheme), 12, 12)
end

function settings:mousepressed(x, y, k)
    self.keypad:input(x, y)
end

function settings:keypressed(key)
    if key == "escape" then
        love.event.push("quit")
    end
end

return settings
