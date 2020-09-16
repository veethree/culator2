local calculatorState = {}

function calculatorState:load()
    mainLayout = {
        {"random average", "history"},
        {"c", "*", "<"},
        {"7", "8", "9", "/"},
        {"4", "5", "6", "+"},
        {"1", "2", "3", "-"},
        {"0", "="}
    }
    mainKeypad = keypad.new(mainLayout, 0, displayHeight, lg.getWidth(), lg.getHeight() - displayHeight, inp)
    mainKeypad:setRowSetting(1, "height", 0.5)
    mainKeypad:updateLayout()

    mainKeypad:addKeyFunction("random average", function()
       -- calculator:runFormula()
        state:setState("randomAverage", display:read())
    end)
    mainKeypad:addKeyFunction("history", print)

end

function calculatorState:update(dt)

end

function calculatorState:draw()
    mainKeypad:draw()
end

function calculatorState:mousepressed(x, y, k)
    mainKeypad:input(x, y)
end

function calculatorState:keypressed(key)
    if key == "escape" then
        love.event.push("quit")
    end
end

return calculatorState
