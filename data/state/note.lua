local note = {name = "Note"}

function note:loadKeypad()
    self.mainLayout = {
        {"c", "<"},
        {"7", "8", "9"},
        {"4", "5", "6"},
        {"1", "2", "3"},
        {"0", "<"},
        {"Back", "Clear", "Text", "Save"}
    }

    self.mainKeypad = keypad.new(self.mainLayout, safe.x, safe.y + (displayHeight * 1.5), safe.width, safe.height - (displayHeight * 1.5), self.keyPadInput)
    self.mainKeypad:setRowSetting(1, "height", 1)
    self.mainKeypad:setRowSetting(2, "height", 1)
    self.mainKeypad:setRowSetting(3, "height", 1)
    self.mainKeypad:setRowSetting(6, "height", 0.8)
    self.mainKeypad:setSpecial("Save")
    self.mainKeypad:setSpecial("Clear")
    self.mainKeypad:setSpecial("Back")
    self.mainKeypad:setSpecial("Text")
    self.mainKeypad:updateLayout()

    self.mainKeypad:addKeyFunction("Back", function()
        saveConfig()
        state:setState("calculator")
    end)

    self.mainKeypad:addKeyFunction("Clear", function()
        config.notes = {}
        state:getState().list = config.notes
        saveConfig()
    end)

    self.mainKeypad:addKeyFunction("Text", function()
        love.keyboard.setTextInput(not love.keyboard.hasTextInput())
    end)

    self.mainKeypad:addKeyFunction("Save", function()
        if calculator:hasFormula() then
            config.notes[#config.notes + 1] = display:read()
            display:clear()
            saveConfig()
        end
    end)

end

function note:load(data)
    display:clear()
    calculator:clear()
    self.list = config.notes
    self.font = theme.font.small
    self.fontHeight = self.font:getAscent() - self.font:getDescent()

    self.alpha = 0
    self.targetAlpha = 1

    self.reverse = false

    self.top = safe.y + (safe.height * 0.05)
    self.yOffset = self.top
    self.real_y = 0
    self.startyOffset = 0
    self.startY = safe.y

    self.listLength = 0
    self.inputWait = 0.1
    self.hue = 0
    self.holdTime = 0.4
    self.holdTick = 0
    self.abortHold = false
    self.holdActionDone = false

    self.string = ""

    self:loadKeypad()

    displayHeight = normalDisplayHeight * 1.5
end

function note:reverseList()
    local newList = {}
    for i=#self.note, 1, -1 do
        newList[#newList + 1] = self.note[i]
    end
    self.note = newList
end

function note.keyPadInput(key)
    self = note
    if key == "c" then
        calculator:input("c")
        display:clear()
        display:clearTip()
    elseif key == "Save" then
        self.list[#self.list + 1] = display:read()
        calculator:input("c")
        display:clear()
        display:clearTip()
    else
        calculator:input(key)
    end
end

function note:update(dt)
    self.mainKeypad:update(dt)

    self.hue = self.hue + 20 * dt
    self.inputWait = self.inputWait - dt
    if self.inputWait < 0 then self.inputWait = 0 end
    self.alpha = self.alpha + (self.targetAlpha - self.alpha) * theme.smoof * dt

    self.real_y = self.real_y + (self.yOffset - self.real_y) * theme.smoof * dt

    if self.inputWait == 0 and not self.holdActionDone then
        if love.mouse.isDown(1) then
            self.yOffset = self.startyOffset - (self.startY - love.mouse.getY())
            if self.yOffset > self.top then self.yOffset = self.top end
            if self.yOffset < -self.listLength then self.yOffset = -self.listLength end
                
            if math.abs(self.startY - love.mouse.getY()) < self.fontHeight and not self.abortHold then
                self.holdTick = self.holdTick + dt
                if self.holdTick > self.holdTime then
                    local item, id = self:getTouchItem(love.mouse.getY())
                    table.remove(self.list, id)
                    saveConfig()
                    self.holdActionDone = true
                end
            else
                self.abortHold = true
            end 
        else
            self.holdTick = 0
        end
    end
end

function note:getTouchItem(ty)
    local item, index = false, false
    for i,v in ipairs(self.list) do
        local y = safe.y + self.fontHeight * (i - 1) + ((self.fontHeight * 0.5) * (1 - self.alpha)) + self.yOffset

        if ty > y and ty < y + self.fontHeight then
            item = tostring(v)
            index = i
            break
        end
    end
    if item then
        if item:find("=") then
            item = item:match("[%d%+%-%*%./]+")
        end
    end
    return item, index
end

function note:draw()
    
    lg.setFont(self.font)
    for i,v in ipairs(self.list) do
        local y = safe.y + self.fontHeight * (i - 1)

        lg.setColor(theme.display_tip)

        setAlpha(self.alpha)
        lg.print(v, 12, y + ((self.fontHeight * 0.5) * (1 - self.alpha)) + self.real_y)
        lg.setColor(theme.keyboard_stroke)
        lg.line(0, y + self.fontHeight + self.real_y, lg.getWidth(), y + self.fontHeight + self.real_y)
        self.listLength = y
    end

    lg.setColor(theme.display_color)
    lg.rectangle("fill", 0, safe.y + displayHeight - (safe.height * 0.06), safe.width, safe.height * 0.1)
    if mobile then
        if not lk.hasTextInput() then
            self.mainKeypad:draw()
        end
    else
        self.mainKeypad:draw()
    end
end

function note:textinput(t)
    self.string = self.string..t
    display:print(self.string)
end

function note:mousepressed(x, y, key)
    self.abortHold = false
    self.startY = y
    self.startyOffset = self.yOffset
    if mobile then
        if not lk.hasTextInput() then
            self.mainKeypad:input(x, y)
        end
    else
        self.mainKeypad:input(x, y)
    end
end

function note:mousereleased(x, y, key)
    self.holdActionDone = false
end

return note
