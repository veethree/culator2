NAME = "Culator 2"
VERSION = 1.6

lg = love.graphics
fs = love.filesystem
lk = love.keyboard

mobile = false
if love.system.getOS() == "Android" then
    mobile = true
end


function love.load()
    --love.system.openURL("file://"..fs.getSaveDirectory())

    math.randomseed(os.time() + love.mouse.getX() * 1000)
    -- Love setup
    lg.setLineStyle("rough")
    lg.setDefaultFilter("nearest", "nearest")
    love.window.setTitle(NAME.." | "..VERSION)
    local sx, sy, sw, sh = love.window.getSafeArea()
    safe = {
        x = sx, y = sy, width = sw, height = sh
    }
    debug_mode = false


    -- safe.y = 32
    -- safe.height = safe.height - 32

    http = require("socket.http")
    require("data.class.util")
    requireFolder("data/class")
    
    default_config = {
        theme = 1,
        vibration = true,
        vibration_strength = 0.01,
        display_height = 0.3,
        use_top_margin = true,
        notes = {}
    }

    config = readConfig()
    if not config then
        config = default_config
    end

    --Filling in defaults if they're missing
    config.theme = config.theme or 1
    config.vibration = config.vibration or true
    config.vibration_strength = config.vibration_strength or 0.01
    config.display_height = config.display_height or 0.3
    config.notes = config.notes or {}
    config.use_top_margin = config.use_top_margin or true

    fontFace = "data/font/RobotoCondensed-Light.ttf"
    fontFaceTiny = "data/font/Minecraft.ttf"
    fontFaceBold = "data/font/Roboto-Bold.ttf"

    themes = require("data.art.themes")

    readHistory()
    setTheme(config.theme)
    
    normalDisplayHeight = math.floor(lg.getHeight() * config.display_height)
    displayHeight = normalDisplayHeight

    weed:load()
    state:loadStates("data/state")
    state:setState("calculator")
    display:print("Hello!")
    display:setTip("Welcome to culator 2!")

    
    flash = {
        x = 0,
        y = 0,
        alpha = 0
    }

    canvas = lg.newCanvas()
    canvas2 = lg.newCanvas()

    weed_shader = lg.newShader[[
        extern number time;
        extern vec2 window;
        vec4 effect( vec4 color, Image tex, vec2 tc, vec2 sc ){
          tc.x = tc.x + sin(tc.y * 20.0 + time) * window.x * 0.00001;
          tc.y = tc.y + sin(tc.x * 20.0 + time) * window.y * 0.00001;
    
          return Texel(tex, tc);
        }
  ]]

    color_shader = lg.newShader[[
        extern number time;
        extern vec2 window;
        vec4 effect( vec4 color, Image tex, vec2 tc, vec2 sc ){
          number offset = sin(time * 0.2) * window.x * 0.1;
          return vec4(Texel(tex, tc + offset).r, Texel(tex, tc).g, Texel(tex, tc - offset).b, 1.0);
        }
  ]]
    time = 0
    weed_shader:send("time", time)
    weed_shader:send("window", {lg.getWidth(), lg.getHeight()})
    color_shader:send("window", {lg.getWidth() * 0.0001, lg.getHeight() * 0.0001})
end

function readConfig()
    local c = fs.load("config.lua")
    if c then
        return c()
    else
        return false
    end
end

function saveConfig()
    local s = tableToFile(config)
    fs.write("config.lua", s)
end

function clearConfig()
    fs.remove("config.lua")
    love.load()
end

function setTheme(id)
    theme = themes[tonumber(id)]
    lg.setBackgroundColor(theme.display_bar)
    config.theme = id
    saveConfig()
end

function saveHistory()
    local s = ""
    for i,v in ipairs(history) do
        s = s..v.."\n"
    end
    fs.write("history.txt", s)    
end

function readHistory()
    history = {}
    if fs.getInfo("history.txt") then
        for line in fs.lines("history.txt") do
            history[#history + 1] = line
        end
    end
end

function clearHistory()
    history = {}
    saveHistory()
end

function love.update(dt)
    time = time + dt * 4
    if time > math.pi * 2 then
        time = 0
    end
    weed_shader:send("time", time)
    color_shader:send("time", time)
    state:update(dt)
    weed:update(dt)
    flash.alpha = flash.alpha + (0 - flash.alpha) * theme.smoof * dt
end

function love.draw()
    lg.setCanvas(canvas)
    lg.clear()
    --Background
    lg.setColor(theme.display_color)
    lg.rectangle("fill", 0, 0, lg.getWidth(), lg.getHeight())

    state:draw()
    lg.setColor(theme.display_bar)
    lg.rectangle("fill", safe.x, 0, safe.width, safe.height * 0.05 + safe.y)
    display:draw(0, safe.y, lg.getWidth(), displayHeight)
    weed:draw()

    lg.setColor(0.6, 0.6, 0.6)
    setAlpha(flash.alpha)
    lg.setBlendMode("add")
    lg.circle("fill", flash.x, flash.y, (lg.getWidth() * 0.2) * (1 - flash.alpha))
    lg.setBlendMode("alpha")

    lg.setCanvas(canvas2)
    lg.clear()
    lg.setColor(1, 1, 1, 1)
    if weed.running then lg.setShader(color_shader) end
    lg.draw(canvas)
    lg.setShader()

    lg.setCanvas()
    local scale = 1
    if weed.running then 
        lg.setShader(weed_shader) 
        scale = 1 + (math.sin(time) * 0.05) + 0.1
    end
    lg.setColor(1, 1, 1, 1)
    lg.draw(canvas2, lg.getWidth() / 2, lg.getHeight() / 2, 0, scale, scale, lg.getWidth() / 2, lg.getHeight() / 2)
    lg.setShader()

    if debug_mode then
        lg.setColor(0, 1, 0, 1)
        lg.setFont(theme.font.tiny)
        lg.print("SAFE AREA: "..safe.x..", "..safe.y..", "..safe.width..", "..safe.height, 12, safe.y)
        lg.rectangle("line", safe.x + 1, safe.y, safe.width - 1, safe.height)
    end
end

function love.resize(w, h)
    love.load()
end

function love.textinput(t)
    state:textinput(t)
end

function love.mousepressed(x, y, k)
    flash.alpha = 1
    flash.x = x
    flash.y = y
    state:mousepressed(x, y, k)
end

function love.mousereleased(x, y, k)
    state:mousereleased(x, y, k)
end

function love.keypressed(key)
    state:keypressed(key)
    if key == "escape" then
        love.event.push("quit")
    elseif key == "c" then
        love.system.openURL("file://"..fs.getSaveDirectory())
    end
end
