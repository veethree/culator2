local weed = {}

function weed:load()
    self.img = lg.newImage("data/art/cannabis.png")
    self.list = {}
    self.count = 100
    self.speed = {10, 100}
    self.size = lg.getWidth() * 0.2
    self.assetSize = self.img:getWidth()
    self.song = love.audio.newSource("data/art/weed.ogg", "static")
    self.song:setLooping(true)
    self.bgHue = 255 * math.random()
    self.canvas = lg.newCanvas()
    self.canvas2 = lg.newCanvas()


    for i=1, self.count do
        self.list[i] = {
                x = math.random(lg.getWidth()),
                y = math.random(-100, lg.getHeight()),
                speed = math.random(self.speed[1], self.speed[2]),
                size = 0.2 + math.random() * 0.8,
                sway = math.random() * lg.getHeight(),
                angle = (math.pi * 2) * math.random()
            }
    end

    self.shader = lg.newShader([[
        vec4 effect( vec4 color, Image tex, vec2 tc, vec2 sc ){
            vec4 pixel = Texel(tex, tc);
            pixel.r = pixel.b;
            pixel.b = pixel.g;
            return pixel;
           } 
        ]])
end

function weed:start()
    self.running = true
    self.song:play()
end

function weed:stop()
    self.running = false
    self.song:stop()
end

function weed:update(dt)
    if self.running then
        self.bgHue = self.bgHue + 10 * dt
        if self.bgHue > 255 then
            self.bgHue = 0
        end
    
        for i,v in ipairs(self.list) do
            v.y = v.y + v.speed * dt
            v.angle = v.angle + (v.size) * dt
            v.x = v.x + math.sin((v.y + v.sway) * 0.01)
            if v.y > lg.getHeight() + self.size then
                v.y = -self.size
            end
        end
    end
end

function weed:draw()
    local oc = lg.getCanvas()
    lg.setCanvas(self.canvas)
    lg.clear()
    if self.running then
        lg.setBlendMode("add")
        --lg.setColor(0, 1,0, 0.3)
        --lg.rectangle("fill", 0, 0, lg.getWidth(), lg.getHeight())
        lg.setBlendMode("alpha")
        for i,v in ipairs(self.list) do
            lg.setColor(1, 1, 1, 1)
            local size = self.size * v.size
            lg.draw(self.img, v.x, v.y, v.angle, size /  self.assetSize, size /  self.assetSize, self.assetSize / 2, self.assetSize / 2)
        end
    end

    lg.setCanvas(oc)
    lg.setColor(1, 1, 1, 1)
    local old = lg.getShader()
    --lg.setShader(self.shader)
    lg.draw(self.canvas)
    --lg.setShader(old)
end

return weed
