utf8 = require("utf8")
local display = {
    font = lg.newFont(math.floor(lg.getWidth() * 0.08)),
    tipFont = lg.newFont(math.floor(lg.getWidth() * 0.03)),
    margin = 12,
    text = "",
    tip = ""
}

function display:setTip(tip)
    self.tip = tip
end

function display:clearTip()
    self.tip = ""
end

function display:print(text)
    self:clear()
    self.text = text
end

function display:read()
    return self.text
end

function display:clear()
    self.text = ""
    self.tip = ""
end

function display:draw(x, y, width, height)
    lg.setFont(self.font)
    local fontHeight = self.font:getAscent() - self.font:getDescent()
    local textWidth, lines = self.font:getWrap(self.text, width - (self.margin))
    local originY = (y + height - self.margin - fontHeight) 
    for i,v in ipairs(lines) do
        lg.print(v, x + self.margin, originY - fontHeight * ((#lines - i)))
        
    end

    lg.setColor(0.8, 0.8, 0.8, 1)
    lg.setFont(self.tipFont)
    lg.print(self.tip, x + self.margin, y + height)
end

return display
