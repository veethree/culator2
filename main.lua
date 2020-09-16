lg = love.graphics
fs = love.filesystem

function love.load()
    -- Love setup
    lg.setLineStyle("rough")
    lg.setDefaultFilter("nearest", "nearest")

    require("data.class.util")
    requireFolder("data/class")
    
    displayHeight = math.floor(lg.getHeight() * 0.4)

    state:loadStates("data/state")
    state:setState("calculator")
    display:print("Hello!")
    display:setTip("Welcome to Culator 2!")
end

function love.update(dt)
    state:update(dt)
end

function love.draw()
    state:draw()
    display:draw(0, 0, lg.getWidth(), displayHeight)
end

function love.mousepressed(x, y, k)
   state:mousepressed(x, y, k)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.push("quit")
    end
end
