function love.conf(t)
    --t.console = true
    t.window.width = 300
    t.window.height = 600
    --Fullscreen
    local fullscreen = false
    if love._os == "Android" then
        fullscreen = true
    end
    t.window.fullscreen = fullscreen
end
