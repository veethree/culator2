utf8 = require("utf8")
local calculator = {
    formula = "",
    resault = false,
    history = {},
    font = lg.newFont(math.floor(lg.getWidth() * 0.08)),
    margin = 12
}

function calculator:input(t)
    if #t < 2 then
        local lastCharacter = self.formula:sub(-1)
        if t == "=" then
            self:runFormula()
        elseif t == "<" then
            local offset = utf8.offset(self.formula, -1)
            if offset then
                self.formula = self.formula:sub(1, offset - 1)
            end
        elseif t == "c" then
            self.formula = ""
        else
            -- If t is a symbol
            if not tonumber(t) then
                if tonumber(lastCharacter) then
                    self.formula = self.formula..t
                end
            else
                if self.resault then
                    self.formula = ""
                    display:clear()
                    self.resault = false
                end
                self.formula = self.formula..t
            end
        end
    end
    display:print(self.formula)
end

function calculator:runFormula()
    if #self.formula > 0 then
        local func, err = loadstring("return tostring("..self.formula..")")
        if func then
            self.formula = func()
        else
            self.formula = err
        end
    end
    self.resault = true
    display:print(self.formula)
end

return calculator
