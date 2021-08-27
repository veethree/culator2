local custom_theme = {name = "Custom Theme"}

function custom_theme:loadKeypad()
    self.set_vibration = false
    self.set_display = false

    self.apply_pressed = false

    self.fields = {}
    self.field_names = {
        "display_color", "display_text", "display_tip", "display_bar", "display_bar_text",
        "keyboard_color", "keyboard_text", "keyboard_stroke", "special", "special_alt"
    }

    for i,v in pairs(self.field_names) do
        self.fields[#self.fields + 1] = v
    end

    self.current_field = 1
    print(#self.fields)

    self.current_color = {0, 0, 0, 1}

    self.mainLayout = {
        {"Red", "Green", "Blue", "Alpha"},
        {"Cancel", "Previous", "Next", "Apply"}
    }

    self.mainKeypad = keypad.new(self.mainLayout, safe.x, safe.y + displayHeight, safe.width, safe.height - displayHeight, self.keyPadInput)
    self.mainKeypad:setRowSetting(2, "height", 0.2)
    self.mainKeypad:setRowSetting(1, "height", 1.5)
    self.mainKeypad:updateLayout()

    self.mainKeypad:addKeyFunction("Apply", function(normal_x, normal_y)
        if not self.apply_pressed then
            theme[self.fields[self.current_field]] = copy(self.current_color)
            self.apply_pressed = true
        end
    end)

    self.mainKeypad:addKeyFunction("Next", function(normal_x, normal_y)
        if not self.apply_pressed then
            if self.current_field < #self.fields then
                self.current_field = self.current_field + 1
            else
                state:setState("settings")
            end
            self.apply_pressed = true
        end
    end)

    self.mainKeypad:addKeyFunction("Previous", function(normal_x, normal_y)
        if not self.apply_pressed then
            if self.current_field > 0 then
                self.current_field = self.current_field - 1
            else
                state:setState("settings")
            end
            self.apply_pressed = true
        end
    end)

    self.mainKeypad:addKeyFunction("Red", function(normal_x, normal_y)
        normal_x = normal_x or 0
        normal_y = normal_y or 0
        state:getState().current_color[1] = 2 - normal_y
    end)

    self.mainKeypad:addKeyFunction("Green", function(normal_x, normal_y)
        normal_x = normal_x or 0
        normal_y = normal_y or 0
        state:getState().current_color[2] = 2 - normal_y
    end)

    self.mainKeypad:addKeyFunction("Blue", function(normal_x, normal_y)
        normal_x = normal_x or 0
        normal_y = normal_y or 0
        state:getState().current_color[3] = 2 - normal_y
    end)

    self.mainKeypad:addKeyFunction("Alpha", function(normal_x, normal_y)
        normal_x = normal_x or 0
        normal_y = normal_y or 0
        state:getState().current_color[4] = 2 - normal_y
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
    display:print("custom_theme")
end

function custom_theme:load(data)
    data = data or ""


    self.presses = 0
    self.lastKey = ""
    self:loadKeypad()
    calculator:setFormula(data)
    self.clearHistory = false
    self.selectTheme = false
    self.toggle_vibration = false
    self.total_formula = ""

    display:print("Display Text")
    display:setTip("Tip")
end

function custom_theme.keyPadInput(key)
    self = custom_theme

    calculator:input(key)

    display:print("Display Text")
    display:setTip("Tip")

    self.lastKey = key
end

function custom_theme:update(dt)
    if love.mouse.isDown(1) then
        self.keypad:hold(love.mouse.getX(), love.mouse.getY())
    end
    self.keypad:update(dt)
end

function custom_theme:draw()
    self.keypad:draw()

    lg.setColor(self.current_color)
    lg.setFont(theme.font.regular)
    local p = self.fields[self.current_field] or ""
    lg.printf(p, 0, safe.y + safe.height * 0.05, safe.width,  "center")

    --lg.setColor(0, 1, 1, 1)
    --lg.print(tostring(self.selectTheme), 12, 12)
end

function custom_theme:mousepressed(x, y, k)
    self.keypad:input(x, y)
end

function custom_theme:mousereleased(x, y, k)
    self.apply_pressed = false
end

function custom_theme:keypressed(key)
    if key == "escape" then
        love.event.push("quit")
    end
end

return custom_theme
