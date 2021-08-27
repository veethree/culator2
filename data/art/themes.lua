local themes = {}

themes[1] = {
        name = "Night Mode",
        -- Display
        display_color = convertColor(40, 40, 40, 255),
        display_text = convertColor(220, 220, 220, 255),
        display_tip = convertColor(200, 200, 200, 255),
        display_bar = convertColor(20, 20, 20, 255),
        display_bar_text = convertColor(220, 220, 220, 255),
        -- Keyboard
        keyboard_color = convertColor(20, 20, 20, 255),
        keyboard_text = convertColor(220, 220, 220, 255),
        keyboard_stroke = convertColor(40, 40, 40, 255),
        keyboard_stroke_width = 1,
        special = convertColor(190, 190, 190, 255),
        special_alt = convertColor(20, 20, 20, 255),
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[2] = {
        name = "Day Mode",
        -- Display
        display_color = convertColor(220, 220, 220, 255),
        display_text = convertColor(30, 30, 30, 255),
        display_tip = convertColor(87, 58, 15, 255),
        display_bar = convertColor(210, 210, 210, 255),
        display_bar_text = convertColor(30, 30, 30, 255),
        -- Keyboard
        keyboard_color = convertColor(210, 210, 210, 255),
        keyboard_text = convertColor(30, 30, 30, 255),
        keyboard_stroke = convertColor(220, 220, 220, 255),
        keyboard_stroke_width = 1,
        special = convertColor(60, 60, 60, 255),
        special_alt = convertColor(220, 220, 220, 255),
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[3] = {
        name = "Black & Yellow",
        -- Display
        display_color = convertColor(30, 30, 30, 255),
        display_text = convertColor(220, 220, 220, 255),
        display_tip = convertColor(255, 164, 28, 255),
        display_bar = convertColor(255, 164, 28, 255),
        display_bar_text = convertColor(30, 30, 30, 255),
        -- Keyboard
        keyboard_color = convertColor(255, 164, 28, 255),
        keyboard_text = convertColor(30, 30, 30, 255),
        keyboard_stroke = convertColor(30, 30, 30, 255),
        keyboard_stroke_width = 1,
        special = convertColor(30, 30, 30, 255),
        special_alt = convertColor(255, 164, 28, 255),
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[4] = {
        name = "Code Red",
        -- Display
        display_color = convertColor(30, 30, 30, 255),
        display_text = convertColor(220, 220, 220, 255),
        display_tip = convertColor(227, 41, 41, 255),
        display_bar = convertColor(227, 41, 41, 255),
        display_bar_text = convertColor(30, 30, 30, 255),
        -- Keyboard
        keyboard_color = convertColor(227, 41, 41, 255),
        keyboard_text = convertColor(30, 30, 30, 255),
        keyboard_stroke = convertColor(30, 30, 30, 255),
        keyboard_stroke_width = 1,
        special = convertColor(30, 30, 30, 255),
        special_alt = convertColor(227, 41, 41, 255),
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[5] = {
        name = "Red & White",
        -- Display
        display_color = convertColor(220, 220, 220, 255),
        display_text = convertColor(30, 30, 30, 255),
        display_tip = convertColor(227, 41, 41, 255),
        display_bar = convertColor(227, 41, 41, 255),
        display_bar_text = convertColor(220, 220, 220, 255),
        -- Keyboard
        keyboard_color = convertColor(227, 41, 41, 255),
        keyboard_text = convertColor(220, 220, 220, 255),
        keyboard_stroke = convertColor(220, 220, 220, 255),
        keyboard_stroke_width = 1,
        special = convertColor(220, 220, 220, 255),
        special_alt = convertColor(227, 41, 41, 255),
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[6] = {
        name = "Midnight",
        -- Display
        display_color = convertColor(33, 35, 43, 255),
        display_text = convertColor(237, 167, 135, 255),
        display_tip = convertColor(130, 178, 255, 255),
        display_bar = convertColor(33, 35, 43, 255),
        display_bar_text = convertColor(134, 196, 110, 255),
        -- Keyboard
        keyboard_color = convertColor(33, 35, 43, 255),
        keyboard_text = convertColor(237, 167, 135, 255),
        keyboard_stroke = convertColor(28, 30, 38, 255),
        keyboard_stroke_width = 1,
        special = convertColor(134, 196, 110, 255),
        special_alt = convertColor(33, 35, 43, 255),
        -- Animation
        smoof = 15,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[7] = {
        name = "Dirt",
        -- Display
        display_color = convertColor(79, 57, 49, 255),
        display_text = convertColor(255, 135, 43, 255),
        display_tip = convertColor(104, 156, 212, 255),
        display_bar = convertColor(79, 57, 49, 255),
        display_bar_text = convertColor(255, 135, 43, 255),
        -- Keyboard
        keyboard_color = convertColor(79, 57, 49, 255),
        keyboard_text = convertColor(255, 135, 43, 255),
        keyboard_stroke = convertColor(99, 68, 57, 255),
        keyboard_stroke_width = 1,
        special = convertColor(255, 135, 43, 255),
        special_alt = convertColor(79, 57, 49, 255),
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

local c = convertColor(36, 224, 108, 255)
themes[8] = {
        name = "Minimal Mint",
        -- Display
        display_color = c,
        display_text = convertColor(30, 30, 30, 255),
        display_tip = convertColor(30, 30, 30, 255),
        display_bar = c,
        display_bar_text = convertColor(30, 30, 30, 255),
        -- Keyboard
        keyboard_color = convertColor(33, 204, 99, 255),
        keyboard_text = convertColor(30, 30, 30, 255),
        keyboard_stroke = convertColor(33, 204, 99, 255),
        keyboard_stroke_width = 1,
        special = convertColor(33, 204, 99, 255),
        special_alt = convertColor(30, 30, 30, 255),
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

local c = convertColor(204, 51, 51, 255)
themes[9] = {
        name = "Minimal Red",
        -- Display
        display_color = c,
        display_text = convertColor(30, 30, 30, 255),
        display_tip = convertColor(30, 30, 30, 255),
        display_bar = c,
        display_bar_text = convertColor(30, 30, 30, 255),
        -- Keyboard
        keyboard_color = convertColor(191, 46, 46, 255),
        keyboard_text = convertColor(30, 30, 30, 255),
        keyboard_stroke = convertColor(191, 46, 46, 255),
        keyboard_stroke_width = 1,
        special = convertColor(191, 46, 46, 255),
        special_alt = convertColor(30, 30, 30, 255),
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[10] = {
        name = "Amoled",
        -- Display
        display_color = convertColor(0, 0, 0, 255),
        display_text = convertColor(255, 255, 255, 255),
        display_tip = convertColor(180, 180, 180, 255),
        display_bar = convertColor(0, 0, 0, 255),
        display_bar_text = convertColor(180, 180, 180, 255),
        -- Keyboard
        keyboard_color = convertColor(0, 0, 0, 255),
        keyboard_text = convertColor(255, 255, 255, 255),
        keyboard_stroke = convertColor(0, 0, 0, 255),
        keyboard_stroke_width = 1,
        special = convertColor(20, 20, 20, 255),
        special_alt = convertColor(180, 180, 180, 255),
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

local c = convertColor(3, 186, 252, 255)
local c2 = convertColor(20, 20, 20, 255)
themes[11] = {
        name = "Neon Blue",
        -- Display
        display_color = c2,
        display_text = c,
        display_tip = c,
        display_bar = c2,
        display_bar_text = c,
        -- Keyboard
        keyboard_color = c2,
        keyboard_text = c,
        keyboard_stroke = c,
        keyboard_stroke_width = 1,
        special = c,
        special_alt = c2,
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

local c = convertColor(252, 219, 3, 255)
local c2 = convertColor(20, 20, 20, 255)
themes[12] = {
        name = "Neon Yellow",
        -- Display
        display_color = c2,
        display_text = c,
        display_tip = c,
        display_bar = c2,
        display_bar_text = c,
        -- Keyboard
        keyboard_color = c2,
        keyboard_text = c,
        keyboard_stroke = c,
        keyboard_stroke_width = 1,
        special = c,
        special_alt = c2,
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }
--3, 252, 98

local c = convertColor(3, 252, 98, 255)
local c2 = convertColor(20, 20, 20, 255)
themes[13] = {
        name = "Neon Mint",
        -- Display
        display_color = c2,
        display_text = c,
        display_tip = c,
        display_bar = c2,
        display_bar_text = c,
        -- Keyboard
        keyboard_color = c2,
        keyboard_text = c,
        keyboard_stroke = c,
        keyboard_stroke_width = 1,
        special = c,
        special_alt = c2,
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }
    --255, 0, 119

local c = convertColor(255, 0, 119, 255)
local c2 = convertColor(20, 20, 20, 255)
themes[14] = {
        name = "Neon Pink",
        -- Display
        display_color = c2,
        display_text = c,
        display_tip = c,
        display_bar = c2,
        display_bar_text = c,
        -- Keyboard
        keyboard_color = c2,
        keyboard_text = c,
        keyboard_stroke = c,
        keyboard_stroke_width = 1,
        special = c,
        special_alt = c2,
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

local c = convertColor(255, 0, 119, 255)
local c2 = convertColor(220, 220, 220, 255)
themes[15] = {
        name = "Hello Kitty",
        -- Display
        display_color = c2,
        display_text = c,
        display_tip = c,
        display_bar = c2,
        display_bar_text = c,
        -- Keyboard
        keyboard_color = c2,
        keyboard_text = c,
        keyboard_stroke = c,
        keyboard_stroke_width = 1,
        special = c,
        special_alt = c2,
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

local c = convertColor(219, 103, 103, 255)
local c2 = convertColor(51, 37, 37, 255)
themes[16] = {
        name = "Pink",
        -- Display
        display_color = c2,
        display_text = c,
        display_tip = c,
        display_bar = c2,
        display_bar_text = c,
        -- Keyboard
        keyboard_color = c2,
        keyboard_text = c,
        keyboard_stroke = c2,
        keyboard_stroke_width = 1,
        special = c,
        special_alt = c2,
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }


local c = convertColor(30, 30, 30, 255)
local c2 = convertColor(222, 203, 135, 255)
themes[17] = {
        name = "Sand",
        -- Display
        display_color = c,
        display_text = c2,
        display_tip = c2,
        display_bar = c2,
        display_bar_text = c,
        -- Keyboard
        keyboard_color = c2,
        keyboard_text = c,
        keyboard_stroke = c2,
        keyboard_stroke_width = 1,
        special = c2,
        special_alt = c,
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

local c = convertColor(230, 230, 230, 255)
local c2 = convertColor(63, 32, 77, 255)
local c3 = convertColor(81, 40, 99, 255)
themes[18] = {
        name = "Lean",
        -- Display
        display_color = c,
        display_text = c2,
        display_tip = c2,
        display_bar = c,
        display_bar_text = c2,
        -- Keyboard
        keyboard_color = c2,
        keyboard_text = c,
        keyboard_stroke = c2,
        keyboard_stroke_width = 1,
        special = c3,
        special_alt = c,
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

local c = convertColor(201, 44, 44, 255)
local c2 = convertColor(20, 20, 20, 255)
local c3 = convertColor(30, 30, 30, 255)
themes[19] = {
        name = "Coca Cola",
        -- Display
        display_color = c,
        display_text = c2,
        display_tip = c2,
        display_bar = c,
        display_bar_text = c2,
        -- Keyboard
        keyboard_color = c2,
        keyboard_text = c,
        keyboard_stroke = c2,
        keyboard_stroke_width = 1,
        special = c3,
        special_alt = c,
        -- Animation
        smoof = 10,

        -- Font
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

return themes