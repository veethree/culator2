local list = {name = "List"}

function list:load(data)
    data = data or {"Empty"}
    display:clear()
    calculator:clear()
    self.list = data
    self.font = theme.font.small
    self.fontHeight = self.font:getAscent() - self.font:getDescent()

    self.alpha = 0
    self.targetAlpha = 1

    self.reverse = false

    self.button = {
        height = math.floor(lg.getHeight() * 0.1),
        text = "back"
    }

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
    displayHeight = normalDisplayHeight
end

function list:reverseList()
    local newList = {}
    for i=#self.list, 1, -1 do
        newList[#newList + 1] = self.list[i]
    end
    self.list = newList
end

function list:update(dt)
    self.hue = self.hue + 20 * dt
    self.inputWait = self.inputWait - dt
    if self.inputWait < 0 then self.inputWait = 0 end
    self.alpha = self.alpha + (self.targetAlpha - self.alpha) * theme.smoof * dt

    self.real_y = self.real_y + (self.yOffset - self.real_y) * theme.smoof * dt

    if self.inputWait == 0 then
        if love.mouse.isDown(1) then
            self.yOffset = self.startyOffset - (self.startY - love.mouse.getY())
            if self.yOffset > self.top then self.yOffset = self.top end
            if self.yOffset < -self.listLength then self.yOffset = -self.listLength end
                
            if math.abs(self.startY - love.mouse.getY()) < self.fontHeight and not self.abortHold then
                self.holdTick = self.holdTick + dt
                if self.holdTick > self.holdTime then
                    local item = self:getTouchItem(love.mouse.getY())
                    if item then state:setState("calculator", item) end
                end
            else
                self.abortHold = true
            end 
        else
            self.holdTick = 0
        end
    end
end

function list:getTouchItem(ty)
    local item = false
    for i,v in ipairs(self.list) do
        local y = safe.y + self.fontHeight * (i - 1) + ((self.fontHeight * 0.5) * (1 - self.alpha)) + self.yOffset

        if ty > y and ty < y + self.fontHeight then
            item = tostring(v)
            break
        end
    end
    if item then
        if item:find("=") then
            item = item:match("[%d%+%-%*%./]+")
        end
    end
    return item
end

function list:draw()
    lg.setFont(self.font)
    for i,v in ipairs(self.list) do
        local y = safe.y + self.fontHeight * (i - 1)

        lg.setColor(theme.display_text)

        setAlpha(self.alpha)
        lg.print(v, 12, y + ((self.fontHeight * 0.5) * (1 - self.alpha)) + self.real_y)
        lg.setColor(theme.keyboard_stroke)
        lg.line(0, y + self.fontHeight + self.real_y, lg.getWidth(), y + self.fontHeight + self.real_y)
        self.listLength = y
    end

    local y = safe.height - self.button.height + safe.y
    lg.setColor(theme.keyboard_color)
    setAlpha(self.alpha)
    lg.rectangle("fill", 0, y, lg.getWidth(), self.button.height)
    lg.setColor(theme.keyboard_stroke)
    lg.rectangle("line", 0, y, lg.getWidth(), self.button.height)
    lg.setFont(theme.font.regular)
    lg.setColor(theme.keyboard_text)
    setAlpha(self.alpha)
    lg.printf(self.button.text, 0, y + (self.button.height / 2) - (self.fontHeight / 2) + ((self.fontHeight * 0.5) * (1 - self.alpha)), lg.getWidth(), "center")
end

function list:mousepressed(x, y, key)
    self.abortHold = false
    self.startY = y
    self.startyOffset = self.yOffset
    if y > safe.height - self.button.height + safe.y then
        state:setState("calculator")
    end
end

return list
