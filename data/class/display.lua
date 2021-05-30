utf8 = require("utf8")
local display = {
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
    lg.setFont(theme.font.regular)
    local fontHeight = lg.getFont():getAscent() - lg.getFont():getDescent()
    local textWidth, lines = lg.getFont():getWrap(self.text, width - (self.margin))
    local originY = (y + height - self.margin - fontHeight) 
    for i,v in ipairs(lines) do
        lg.print(v, x + self.margin, originY - fontHeight * ((#lines - i)))
    end
    
    lg.setColor(theme.tip)
    lg.setFont(theme.font.tiny)
    local fontHeight = lg.getFont():getAscent() - lg.getFont():getDescent()
    local textWidth, lines = lg.getFont():getWrap(self.tip, width - (self.margin))
    local originY = (y + height - fontHeight) 
    for i,v in ipairs(lines) do
        lg.print(v, x + self.margin, originY - fontHeight * ((#lines - i)))
    end

    lg.setColor(theme.tip)
    lg.printf(os.date("%x"), 0, y + 6, lg.getWidth(), "center")
end

return display
