local themes = {
        { --1
            bg = {0.9, 0.9, 0.9, 1},
            kbg = {0.85, 0.85, 0.85},
            fg = {0.2, 0.2, 0.2, 1},
            line = {0.7, 0.7, 0.7, 1},
            accent = {0.2, 0.2, 0.2},
            tip = {0.9, 0.2, 0.2},
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        },

        {--2
            bg = {0.2, 0.2, 0.2, 1},
            kbg = {0.2, 0.5, 1},
            fg = {0.9, 0.9, 0.9, 1},
            line = {0.3, 0.4, 1},
            accent = {0.9, 0.9, 0.9},
            tip = {0.2, 0.5, 1},
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        },

        {--3
            bg = {0.2, 0.2, 0.2, 1},
            kbg = {219 / 255, 60 / 255, 46 / 255, 1},
            fg = {1, 1, 1, 1},
            line = {239 / 255, 70 / 255, 66 / 255, 1},
            accent = {0.15, 0.15, 0.15, 0},
            tip = {1, 1, 1},
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        },

        {--4
            bg = {0.2, 0.2, 0.2, 1},
            kbg = {46 / 255, 219 / 255, 121 / 255, 255},
            fg = {1, 1, 1, 1},
            line = {56 / 255, 229 / 255, 141 / 255, 255},
            accent = {0.15, 0.15, 0.15, 255},
            tip = {46 / 255, 219 / 255, 121 / 255, 255},
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        },

        {--5
            bg = {35 / 255, 34 / 255, 41 / 255, 1},
            kbg = {0.2, 0.2, 0.2},
            fg = {254 / 255, 185 / 255, 95 / 255, 1},
            line = {254 / 255, 185 / 255, 95 / 255, 1},
            accent = {0, 0.5, 1, 0},
            tip = {0.9, 0.9, 0.9},
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        },

        {--6
            bg = {0.2, 0.2, 0.2, 1},
            kbg = {0.15, 0.15, 0.15},
            fg = {177 / 255, 240 / 255, 41 / 255, 1},
            line = {0.2, 0.2, 0.2, 0.2},
            accent = {0.9, 0.9, 0.9, 1},
            tip = {177 / 255, 240 / 255, 41 / 255, 1},
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        },

        {   --7
            bg = convertColor(36, 38, 41, 255),
            kbg = convertColor(207, 139, 81, 255),
            fg = convertColor(209, 228, 240, 255),
            line = convertColor(120, 66, 20),
            accent = {1, 0.5, 0, 255},
            tip = convertColor(207, 139, 81, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        },

        {   --8
            bg = {245 / 255, 224 / 255, 157 / 255, 1},
            kbg = {235 / 255, 201 / 255, 52 / 255, 1},
            fg = {0, 0, 0, 1},
            line = {1, 1, 1, 0},
            accent = {1, 0.5, 0, 0},
            tip = {0, 0, 0, 1},
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        },

        { --9
            bg = {237 / 255, 138 / 255, 187 / 255, 1},
            kbg = {149 / 255, 179 / 255, 232 / 255, 1},
            fg = {62 / 255, 66 / 255, 74 / 255, 1},
            line = {1, 1, 1, 0},
            accent = {1, 0.5, 0, 0},
            tip = {169 / 255, 232 / 255, 128 / 255, 1},
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        },

    }

themes[10] = { --169, 232, 128
            bg = convertColor(66, 155, 245, 255),
            kbg = convertColor(230, 230, 230, 255),
            fg = convertColor(42, 42, 42, 255),
            line = convertColor(66, 155, 245, 255),
            accent = {1, 1, 1, 0},
            tip = convertColor(230, 230, 230, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

themes[11] = { --169, 232, 128
            bg = convertColor(85, 189, 74, 255),
            kbg = convertColor(230, 230, 230, 255),
            fg = convertColor(42, 42, 42, 255),
            line = convertColor(85, 189, 74, 255),
            accent = {1, 1, 1, 0},
            tip = convertColor(230, 230, 230, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

themes[12] = { --169, 232, 128
            bg = convertColor(217, 65, 65, 255),
            kbg = convertColor(230, 230, 230, 255),
            fg = convertColor(42, 42, 42, 255),
            line = convertColor(217, 65, 65, 255),
            accent = {1, 1, 1, 0},
            tip = convertColor(230, 230, 230, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

themes[13] = { --169, 232, 128
            bg = convertColor(209, 255, 243, 255),
            kbg = convertColor(86, 156, 140, 255),
            fg = convertColor(50, 50, 50, 255),
            line = convertColor(50, 50, 50, 255),
            accent = {1, 1, 1, 0},
            tip = convertColor(50, 50, 50, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

themes[14] = {
            bg = convertColor(255, 171, 25, 255),
            kbg = convertColor(255, 171, 25, 255),
            fg = convertColor(0, 0, 0, 255),
            line = convertColor(255, 171, 25, 255),
            accent = {1, 1, 1, 0},
            tip = convertColor(0, 0, 0, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

themes[15] = {
            bg = convertColor(55, 61, 237, 255),
            kbg = convertColor(55, 61, 237, 255),
            fg = convertColor(0, 0, 0, 255),
            line = convertColor(55, 61, 237, 255),
            accent = {1, 1, 1, 0},
            tip = convertColor(0, 0, 0, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

themes[16] = {
            bg = convertColor(55, 237, 82, 255),
            kbg = convertColor(55, 237, 82, 255),
            fg = convertColor(0, 0, 0, 255),
            line = convertColor(55, 237, 82, 255),
            accent = {1, 1, 1, 0},
            tip = convertColor(0, 0, 0, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

themes[17] = {
            bg = convertColor(0, 0, 0, 255),
            kbg = convertColor(0, 0, 0, 255),
            fg = convertColor(255, 255, 255, 255),
            line = convertColor(0, 0, 0, 255),
            accent = {1, 1, 1, 0},
            tip = convertColor(255, 255, 255, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

themes[18] = {
            bg = convertColor(255, 255, 255, 255),
            kbg = convertColor(255, 255, 255, 255),
            fg = convertColor(0, 0, 0, 255),
            line = convertColor(255, 255, 255, 255),
            accent = {1, 1, 1, 0},
            tip = convertColor(0, 0, 0, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

themes[19] = {
            bg = convertColor(100, 100, 100, 255),
            kbg = convertColor(100, 100, 100, 255),
            fg = convertColor(200, 200, 200, 255),
            line = convertColor(100, 100, 100, 255),
            accent = {1, 1, 1, 0},
            tip = convertColor(200, 200, 200, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

-- Easter egg
themes[81] = { --169, 232, 128
            bg = convertColor(20, 20, 20, 255),
            kbg = convertColor(220, 220, 220, 255),
            fg = convertColor(212, 42, 42, 255),
            line = {1, 1, 1, 0},
            accent = {1, 0.5, 0, 0},
            tip = convertColor(212, 42, 42, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

themes[420] = { --169, 232, 128
            bg = convertColor(55, 179, 66, 255),
            kbg = convertColor(55, 179, 66, 255),
            fg = convertColor(255, 255, 255, 255),
            line = convertColor(29, 87, 34, 255),
            accent = {1, 0.5, 0, 0},
            tip = convertColor(255, 255, 255, 255),
            smoof = 10,
            font = {
                tiny = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.05)),
                regular = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.1)),
                small = lg.newFont(fontFace, math.floor(lg.getWidth() * 0.08))
            }
        }

return themes