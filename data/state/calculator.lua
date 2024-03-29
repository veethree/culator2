local calculatorState = {name = "Calculator"}

function calculatorState:loadKeypad()
    self.mainLayout = {
        {"random average", "history", "CH"},
        {"c", "*", "<"},
        {"7", "8", "9", "/"},
        {"4", "5", "6", "+"},
        {"1", "2", "3", "-"},
        {"0", ".", "="}
    }

    self.mainKeypad = keypad.new(self.mainLayout, safe.x, safe.y + displayHeight, safe.width, safe.height - displayHeight, self.keyPadInput)
    self.mainKeypad:setRowSetting(1, "height", 0.5)
    self.mainKeypad:setSpecial("random average")
    self.mainKeypad:setSpecial("history")
    self.mainKeypad:setSpecial("CH")
    self.mainKeypad:updateLayout()

    self.mainKeypad:addKeyFunction("random average", function()
        if calculator:hasFormula() then
            state:setState("randomAverage", display:read())
        else
            display:setTip("You must enter a total value first!")
        end
    end)

    self.mainKeypad:addKeyFunction("history", function() 
            state:setState("list", history) 
            state:getState():reverseList()
        end
        )
    self.mainKeypad:addKeyFunction("CH", function() 
            if calculatorState.clearHistory then
                clearHistory()
                calculator:clear()
                display:clear()
                display:setTip("History cleared!")
            else
                display:setTip("Press again to confirm")
                self.clearHistory = true
            end
        end
        )
end

function calculatorState:load(data)
    data = data or ""

    displayHeight = normalDisplayHeight
    self.presses = 0
    self.lastKey = ""
    self:loadKeypad()
    calculator:setFormula(data)
    self.clearHistory = false
    self.selectTheme = false
    self.toggle_vibration = false
    self.total_formula = ""
end

function calculatorState.keyPadInput(key)
    self = calculatorState

    if key == "c" then
        calculator:input(key)
        display:clear()
        display:clearTip()
        self.selectTheme = false
        self.clearHistory = false
        self.toggle_vibration = false
        self.total_formula = ""
    end

    if key ~= "CH" then
        calculatorState.clearHistory = false
    end

    if self.selectTheme then
        if key == "=" then
            local id = tonumber(display:read()) or 0
            if themes[id] then
                setTheme(id)
                self:load()
                display:setTip("Theme '"..themes[id].name.."' selected")
            else
                self.selectTheme = false
                self:load()
                display:setTip("Theme '"..tostring(id).."' does not exist")
            end
        else
            calculator:input(key)
            display:setTip("Selecting theme")
        end
    else
        calculator:input(key)
    end
    
    -- Select theme trigger
    if key == "=" and self.lastKey == "=" then
        if not calculator:hasFormula() then
            display:setTip("Select theme, Press '=' to confirm")
            self.selectTheme = true
        end
    end

    -- debug toggle trigger
    if key == "*" and self.lastKey == "*" then
        if not calculator:hasFormula() then
            debug_mode = not debug_mode
            if debug_mode then
                local stats = lg.getStats()
                local str = "DEBUG_INFO:\nOS: "..love.system.getOS().."\n".."Safe area: X:"..safe.x..", Y:"..safe.y..", W:"..safe.width..", H:"..safe.height..
                "\nWindow: "..lg.getWidth().."x"..lg.getHeight().."\n"
                for k,v in pairs(stats) do
                    str = str..k..": "..v..", "
                end
                
                display:setTip(str)
            end
        end
    end

    -- Settings toggle trigger
    if key == "-" and self.lastKey == "-" then
        if not calculator:hasFormula() then
            state:setState("settings")
        end
    end

    if key == "." and self.lastKey == "." then
        state:setState("icemaker")
    end

    --Easter egg triggers
    --420
    if display:read() == "420" then
        weed:start()
    else
        weed:stop()
    end

    --81
    local quotes = {
        "SUPPORT YOUR LOCAL 81",
        "SYL81",
        "BIG RED MACHINE",
        "RED & WHITE",
        "SUPPORT 81"
    }
    if display:read() == "81" then
        display:setTip(quotes[math.random(#quotes)])
    end

    --80085
    if display:read() == "80085" then
        display:setTip("(  *  Y  *  )")
    end

    --69
    if display:read() == "69" then
        display:setTip("lol")
    end

    self.lastKey = key
end

function calculatorState:update(dt)
    self.mainKeypad:update(dt)
end

function calculatorState:draw()
    self.mainKeypad:draw()
end

function calculatorState:mousepressed(x, y, k)
    self.mainKeypad:input(x, y)
end

function calculatorState:keypressed(key)
    print(key)
    for _, col in ipairs(self.mainLayout) do
        for _, row in ipairs(col) do
            local key = key:gsub("kp", "")
            if key == "backspace" then
                key = "<"
            elseif key == "enter" or key == "return" then
                key = "="
            elseif key == "home" then
                key = "random average"
            end
            if key == row then
                print(key)
                self.keyPadInput(key)
            end
        end
    end
    
    if key == "escape" then
        love.event.push("quit")
    end
end

return calculatorState
