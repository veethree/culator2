local randomAverageState = {name = "Random Average"}

local function rndAvg(total, items, difference)
    local list = {}
    local average = total / items

    -- First stage
    -- Creating the initial list. Does not add up to "total" yet.
    local sum = 0
    for i=1, items do
        list[i] = math.floor(average + math.random(-difference, difference))
        sum = sum + list[i]
    end

    -- Calculating the error, And adding/subtracting the average
    -- error from the list items
    local error = total - sum
    local averageError = error / items
    sum = 0
    for i=1, items do
        list[i] = list[i] + averageError
        sum = sum + list[i]

        error = error - averageError
        if math.floor(error) == 0 then
            break
        end
    end

    -- Rounding numbers 
    sum = 0
    for i=1, items do
        list[i] = math.floor(list[i])
        sum = sum + list[i]
        --print(list[i])
    end

    -- If there's a remainder, Add it to a random item.
    if sum ~= total then
        local i = math.random(items)
        list[i] = list[i] + (total - sum) 
    end
    
    local finalSum = 0
    for i=1, items do
        finalSum = finalSum + list[i]
    end
    return list
end

function randomAverageState:load(data)
    self.settingRange = false
    self.range = 40
    self.mainLayout = {
        {"7", "8", "9"},
        {"4", "5", "6"},
        {"1", "2", "3"},
        {"<", "0", "ok"},
        {"cancel", "set range"}
    }
    self.mainKeypad = keypad.new(self.mainLayout, 0, safe.y + displayHeight, lg.getWidth(), safe.height - displayHeight, self.keyPadInput)
    self.mainKeypad:setRowSetting(5, "height", 0.5)
    self.mainKeypad:updateLayout()
    
    self.mainKeypad:addKeyFunction("cancel", function() state:setState("calculator") end)
    self.mainKeypad:addKeyFunction("set range", function() 
        display:setTip("Enter range")
        self.settingRange = true
    end)
    self.mainKeypad:addKeyFunction("ok", self.ok) 

    self.total = display:read()
    display:clear()
    calculator:clear()
    display:setTip("Enter items")
end

function randomAverageState.ok()
    local self = randomAverageState
    if calculator:hasFormula() then
        if tonumber(display:read()) > 0 then
            if self.settingRange then
                self.range = display:read()
                calculator:clear()
                display:clear()
                display:setTip("Range set to "..self.range..". Enter items.")
                self.settingRange = false
            else
                randomAverageState.items = display:read()
                local list = rndAvg(randomAverageState.total, randomAverageState.items, self.range)
                state:setState("list", list)
            end
        else
            display:setTip("Items cant be 0!")
        end
    end
end

function randomAverageState.keyPadInput(key)
    calculator:input(key)
end

function randomAverageState:update(dt)
    self.mainKeypad:update(dt)
end

function randomAverageState:draw()
    self.mainKeypad:draw()
end

function randomAverageState:mousepressed(x, y, k)
    self.mainKeypad:input(x, y)
end

return randomAverageState
