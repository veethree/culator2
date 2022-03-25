local settings = {name = "Settings"}

function settings:loadKeypad()
    self.set_vibration = false
    self.set_display = false

    self.mainLayout = {
        {"Toggle top margin", "Select theme"},
        {"Toggle vibration", "Set vibration strength"},
        {"Open data folder", "Toggle debug mode"},
        {"Back", "Set display height", "Clear config"}
    }

    self.mainKeypad = keypad.new(self.mainLayout, safe.x, safe.y + displayHeight, safe.width, safe.height - displayHeight, self.keyPadInput)
    self.mainKeypad:setRowSetting(1, "height", 0.5)
    self.mainKeypad:setRowSetting(2, "height", 0.5)
    self.mainKeypad:setRowSetting(3, "height", 0.5)
    self.mainKeypad:setRowSetting(4, "height", 0.5)
    self.mainKeypad:setSpecial("Back")
    self.mainKeypad:updateLayout()

    self.mainKeypad:addKeyFunction("Toggle top margin", function()
        config.use_top_margin = not config.use_top_margin
        saveConfig()
        if not config.use_top_margin then
            local diff = safe.y
            safe.y = 0
            --safe.height = safe.height + diff
        else
            local x, y = love.window:getSafeArea()
            safe.y = y
        end
    end)

    self.mainKeypad:addKeyFunction("Random theme", function()
        local p = math.random(1000)
        for k,v in pairs(theme) do
            if type(v) == "table" then
                if tonumber(v[1]) then
                    theme[k] = hsl(math.random(255), math.random(255), math.random(255), 255)
                end
            end
            p = p + math.random()
        end
    end)

    self.mainKeypad:addKeyFunction("Select theme", function()
        state:setState("theme")
    end)

    self.mainKeypad:addKeyFunction("Toggle vibration", function()
        config.vibration = not config.vibration
        saveConfig()
        local s = "Disabled"
        if config.vibration then
            s = "Enabled"
        end
        display:setTip("Vibration "..s)
    end)

    self.mainKeypad:addKeyFunction("Set vibration strength", function()
        state:getState().keypad = state:getState().numberKeypad
        display:setTip("Set vibraton strength in seconds")
        self.set_vibration = true
    end)

    self.mainKeypad:addKeyFunction("Open data folder", function()
        love.system.openURL("file://"..fs.getSaveDirectory())
    end)

    self.mainKeypad:addKeyFunction("Custom theme", function()
        state:setState("custom_theme")
    end)

    self.mainKeypad:addKeyFunction("Clear history", function()
        clearHistory()
        display:setTip("History cleared")
    end)

    self.mainKeypad:addKeyFunction("Toggle debug mode", function()
        debug_mode = not debug_mode
    end)

    self.mainKeypad:addKeyFunction("Clear config", function()
        clearConfig()
    end)

    self.mainKeypad:addKeyFunction("Back", function()
        state:setState("calculator")
    end)

    self.mainKeypad:addKeyFunction("Set display height", function()
        state:getState().keypad = state:getState().numberKeypad
        display:setTip("Set display height (0-1)")
        self.set_display = true
    end)

    self.numberLayout = {
        {"7", "8", "9"},
        {"4", "5", "6"},
        {"1", "2", "3"},
        {"<", "0", "."},
        {"cancel", "ok"}
    }
    
    self.numberKeypad = keypad.new(self.numberLayout, safe.x, safe.y + displayHeight, safe.width, safe.height - displayHeight, self.keyPadInput)
    self.numberKeypad:setRowSetting(5, "height", 0.5)
    self.numberKeypad:setSpecial("ok")
    self.numberKeypad:updateLayout()

    self.numberKeypad:addKeyFunction("ok", function()
        if #display:read() > 0 then
            if self.set_vibration then
                if tonumber(display:read()) then
                    config.vibration_strength = display:read()
                    display:setTip("Vibration duration set to '"..config.vibration_strength.."'")
                    saveConfig()
                    state:getState().keypad = state:getState().mainKeypad
                    calculator:clear()
                    display:clearText()
                    self.set_vibration = false
                else
                    display:setTip("Invalid duration!")
                    calculator:clear()
                    display:clearText()
                end
            elseif self.set_display then
                local d = tonumber(display:read())
                if d then
                    if d < 0.2 then
                        d = 0.2
                    elseif d > 0.8 then
                        d = 0.8
                    end
                    config.display_height = d
                    saveConfig()
                    love.load()
                    display:setTip("Display height set to '"..config.display_height.."'")
                    self.set_display = false
                else
                    display:setTip("Height must be a number between 0.2 and 0.8")
                    calculator:clear()
                    display:clearText()
                end
            end
        else
            display:setTip("Please enter a value for vibration duration")
        end
    end)

    self.numberKeypad:addKeyFunction("cancel", function()
        state:getState().keypad = state:getState().mainKeypad
        calculator:clear()
        display:clearText()
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

    calculator:input(key)

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
