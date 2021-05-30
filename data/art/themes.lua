local themes = {}

themes[1] = {
        name = "Night Mode",
        bg = convertColor(20, 20, 20, 255),
        kbg = convertColor(20, 20, 20, 255),
        fg = convertColor(220, 220, 220, 255),
        special = convertColor(220, 220, 220, 255),
        special_alt = convertColor(20, 20, 20, 255),
        line = convertColor(50, 50, 50, 255),
        tip = convertColor(180, 180, 180, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[2] = {
        name = "Day Mode",
        bg = convertColor(220, 220, 220, 255),
        kbg = convertColor(220, 220, 220, 255),
        fg = convertColor(40, 40, 40, 255),
        special = convertColor(40, 40, 40, 255),
        special_alt = convertColor(220, 220, 220, 255),
        line = convertColor(240, 240, 240, 255),
        tip = convertColor(80, 80, 80, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[3] = {
        name = "Midnight Blue",
        bg = convertColor(28, 29, 61, 255),
        kbg = convertColor(28, 29, 61, 255),
        fg = convertColor(240, 240, 240, 255),
        special = convertColor(105, 130, 240, 255),
        special_alt = convertColor(20, 20, 20, 255),
        line = convertColor(0, 0, 0, 255),
        tip = convertColor(180, 180, 180, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[4] = {
        name = "Pastel Red",
        bg = convertColor(255, 87, 87, 255),
        kbg = convertColor(255, 87, 87, 255),
        fg = convertColor(240, 240, 240, 255),
        special = convertColor(255, 87, 87, 255),
        special_alt = convertColor(20, 20, 20, 255),
        line = convertColor(255, 70, 70, 255),
        tip = convertColor(20, 20, 20, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[5] = {
        name = "Pastel Blue",
        bg = convertColor(130, 201, 255, 255),
        kbg = convertColor(130, 201, 255, 255),
        fg = convertColor(240, 240, 240, 255),
        special = convertColor(130, 201, 255, 255),
        special_alt = convertColor(20, 20, 20, 255),
        line = convertColor(112, 179, 255, 255),
        tip = convertColor(20, 20, 20, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }
    
themes[6] = {
        name = "Pastel Green",
        bg = convertColor(105, 255, 89, 255),
        kbg = convertColor(105, 255, 89, 255),
        fg = convertColor(240, 240, 240, 255),
        special = convertColor(105, 255, 89, 255),
        special_alt = convertColor(20, 20, 20, 255),
        line = convertColor(110, 255, 141, 255),
        tip = convertColor(20, 20, 20, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[7] = {
        name = "Minimal Bright",
        bg = convertColor(230, 230, 230, 255),
        kbg = convertColor(230, 230, 230, 255),
        fg = convertColor(40, 40, 40, 255),
        special = convertColor(230, 230, 230, 255),
        special_alt = convertColor(20, 20, 20, 255),
        line = convertColor(230, 230, 230, 255),
        tip = convertColor(20, 20, 20, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[8] = {
        name = "Minimal Dark",
        bg = convertColor(20, 20, 20, 255),
        kbg = convertColor(20, 20, 20, 255),
        fg = convertColor(230, 230, 230, 255),
        special = convertColor(20, 20, 20, 255),
        special_alt = convertColor(230, 230, 230, 255),
        line = convertColor(20, 20, 20, 255),
        tip = convertColor(230, 230, 230, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[9] = {
        name = "Minimal Red",
        bg = convertColor(20, 20, 20, 255),
        kbg = convertColor(20, 20, 20, 255),
        fg = convertColor(255, 41, 41, 255),
        special = convertColor(20, 20, 20, 255),
        special_alt = convertColor(230, 230, 230, 255),
        line = convertColor(20, 20, 20, 255),
        tip = convertColor(230, 230, 230, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[10] = {
        name = "Minimal Blue",
        bg = convertColor(20, 20, 20, 255),
        kbg = convertColor(20, 20, 20, 255),
        fg = convertColor(41, 44, 255, 255),
        special = convertColor(20, 20, 20, 255),
        special_alt = convertColor(230, 230, 230, 255),
        line = convertColor(20, 20, 20, 255),
        tip = convertColor(230, 230, 230, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[11] = {
        name = "Minimal Pink",
        bg = convertColor(20, 20, 20, 255),
        kbg = convertColor(20, 20, 20, 255),
        fg = convertColor(255, 92, 165, 255),
        special = convertColor(20, 20, 20, 255),
        special_alt = convertColor(230, 230, 230, 255),
        line = convertColor(20, 20, 20, 255),
        tip = convertColor(230, 230, 230, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[12] = {
        name = "Purple",
        bg = convertColor(43, 21, 71, 255),
        kbg = convertColor(30, 30, 30, 255),
        fg = convertColor(220, 220, 220, 255),
        special = convertColor(43, 21, 71, 255),
        special_alt = convertColor(0, 255, 119, 255),
        line = convertColor(50, 50, 50, 255),
        tip = convertColor(0, 255, 119, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFaceBold, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFaceBold, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[13] = {
        name = "Black & Yellow",
        bg = convertColor(30, 30, 30, 255),
        kbg = convertColor(30, 30, 30, 255),
        fg = convertColor(220, 220, 220, 255),
        special = convertColor(255, 204, 0, 255),
        special_alt = convertColor(30, 30, 30, 255),
        line = convertColor(255, 204, 0, 255),
        tip = convertColor(255, 204, 0, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

themes[14] = {
        name = "Yellow & Black",
        bg = convertColor(255, 204, 0, 255),
        kbg = convertColor(255, 204, 0, 255),
        fg = convertColor(30, 30, 30, 255),
        special = convertColor(30, 30, 30, 255),
        special_alt = convertColor(220, 220, 220, 255),
        line = convertColor(30, 30, 30, 255),
        tip = convertColor(30, 30, 30, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }

local col = {187, 255, 0, 255}
themes[15] = {
        name = "Black & Blue",
        bg = convertColor(47, 56, 77, 255),
        kbg = convertColor(219, 187, 112, 255),
        fg = convertColor(20, 20, 20, 255),
        special = convertColor(219, 187, 112, 255),
        special_alt = convertColor(30, 30, 30, 255),
        line = convertColor(219, 187, 112, 255),
        tip = convertColor(77, 130, 255, 255),
        smoof = 10,
        corner = 0,
        font = {
            tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
            regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
            small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
        }
    }


return themes