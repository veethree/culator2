local randomAverageState = {}

local function randomAverage(total, items, difference)
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
        print(list[i])
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
    print("T: "..total.." | S: "..finalSum)
    return list
end

function randomAverageState:load(data)
    self.mainLayout = {
        {"7", "8", "9"},
        {"4", "5", "6"},
        {"1", "2", "3"},
        {"<", "0", ">"}
    }
    self.mainKeypad = keypad.new(self.mainLayout, 0, displayHeight, lg.getWidth(), lg.getHeight() - displayHeight)
    self.mainKeypad:setRowSetting(4, "height", 0.5)
    self.mainKeypad:updateLayout()
    
    self.mainKeypad:addKeyFunction("<", function() state:setState("calculator") end)

    print(display:read())
end

function randomAverageState:draw()
    self.mainKeypad:draw()
end

function randomAverageState:mousepressed(x, y, k)
    self.mainKeypad:input(x, y)
end

return randomAverageState
