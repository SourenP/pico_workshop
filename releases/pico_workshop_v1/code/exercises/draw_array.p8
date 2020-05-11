pico-8 cartridge // http://www.pico-8.com
version 22
__lua__
function _init()
  c1 = {
    x = 40,
    y = 60,
    r = 10,
    c = 9,
    kapik=24
  }

  c2 = {
    x = 50,
    y = 80,
    r = 10,
    c = 6
  }

  circles = {c1, c2}
  -- or
  -- add(cirlces,c1)
  -- add(circles, c2)
end

function _draw()
    cls()
    for c in all(circles) do
    circfill(c.x,c.y,c.r,c.c)
    end
end
__gfx__
00000000cec000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000ccc0000e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700c000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000c000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000cccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000ccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c0c0c0c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100003602035020300202701021010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
