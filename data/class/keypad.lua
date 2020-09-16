local lg = love.graphics

local keypad = {}
local keypad_meta = {__index = keypad}

local default_theme = {
    background = {0, 0, 0, 1},
    foreground = {0.3, 0.3, 0.3, 1},
    accent = {1, 0.2, 0.2, 1},
    defaultFont = lg.newFont(math.floor(lg.getWidth() * 0.11)),
    tinyFont = lg.newFont(math.floor(lg.getWidth() * 0.05))
}

-- Renders text in the center of the rect
local function renderLabel(text, x, y, width, height)
    local font = lg.getFont()
    local labelWidth = font:getWidth(text)
    local labelHeight = font:getAscent() - font:getDescent()
    local x = x + (width / 2) - (labelWidth / 2)
    local y = y + (height / 2) - (labelHeight / 2)
    lg.print(text, x, y)
end

function keypad.new(layout, x, y, width, height, inputFunction, theme)
    theme = theme or default_theme
    local k = {
       x = x,
       y = y,
       yOffset = 0,
       width = width,
       height = height,
       inputFunction = inputFunction, 
       keyFunctions = {},
       theme = theme
    }
    k.layout = {}
    for i,v in ipairs(layout) do
        k.layout[i] = {
            keys = v,
            settings = {
                height = 1, 
                font = k.theme.defaultFont,
                color = k.theme.foreground
            }
        }
    end

    return setmetatable(k, keypad_meta)
end

function keypad:addKeyFunction(key, func)
   self.keyFunctions[key] = func
end

function keypad:update(dt)

end

-- Calculates the bounding box for a key
-- at (x, y) in the layout array
function keypad:getKeyBounds(x, y, rowHeight)
    local rowLength = #self.layout[y].keys
    local columnLength = #self.layout
    local keyWidth = math.floor(self.width / rowLength)
    local keyHeight = (self.height / columnLength) * rowHeight
    local x = self.x +  keyWidth * (x - 1)
    local y = self.layout[y].settings.rowY
    return x, y, keyWidth, keyHeight
end

function keypad:setRowSetting(index, setting, value)
    self.layout[index].settings[setting] = value
end

function keypad:updateLayout()
    local rowY = self.y
    local totalHeight = 0
    for y=1, #self.layout do
        local settings = self.layout[y].settings
        settings.bounds = {}
        local rowHeight = 0
        if settings.height < 1 then
            settings.font = self.theme.tinyFont
        end
        for x,key in ipairs(self.layout[y].keys) do
            settings.rowY = rowY
            local x, y, width, height = self:getKeyBounds(x, y, settings.height)
            settings.bounds[key] = {
                x = x,
                y = y,
                width = width,
                height = height
            }
            rowHeight = height
        end
        rowY = rowY + rowHeight
        totalHeight = totalHeight + rowHeight
    end
    self.yOffset = math.floor(totalHeight - self.height)
end

function keypad:getBounds()
    return self.x, self.y - self.yOffset, self.width, self.height + self.yOffset
end

function keypad:draw()
    rowY = self.y
    for y=1, #self.layout do
        local settings = self.layout[y].settings
        local rowHeight = 0
        lg.setFont(settings.font)
        for x,key in ipairs(self.layout[y].keys) do
            local x = settings.bounds[key].x
            local y = settings.bounds[key].y - self.yOffset
            local keyWidth = settings.bounds[key].width
            local keyHeight = settings.bounds[key].height
            lg.setColor(self.theme.foreground)
            lg.rectangle("line", x, y, keyWidth, keyHeight)
            lg.setColor(self.theme.accent)
            renderLabel(key, x, y, keyWidth, keyHeight)            

            settings.rowY = rowY
            rowHeight = keyHeight
        end
        rowY = rowY + rowHeight
    end
end

-- put this into a mousepressed or touchpressed callback
-- Checks if (x, y) is on a button and calls the input function if it is
function keypad:input(inputX, inputY)
    inputY = inputY + self.yOffset
    for y=1, #self.layout do
        local settings = self.layout[y].settings
        local rowHeight = 0
        for x,key in ipairs(self.layout[y].keys) do
            local keyX, keyY, keyWidth, keyHeight = self:getKeyBounds(x, y, settings.height)
            if pointInRect(inputX, inputY, keyX, keyY, keyWidth, keyHeight) then
                if type(self.inputFunction) == "function" then
                    self.inputFunction(self.layout[y].keys[x])
                end
                if self.keyFunctions[self.layout[y].keys[x]] then
                    self.keyFunctions[self.layout[y].keys[x]]() 
                end
                break
            end
        end
    end
end

return keypad
