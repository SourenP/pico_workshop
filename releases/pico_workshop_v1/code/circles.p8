function _init()
  circle = {
    x = 64,
    y = 64,
    r = 4,
    c = 6
  }
end

function _update()
  circle.x = flr(rnd(128))
  circle.y = flr(rnd(128))
  circle.c = flr(rnd(16))
  circle.r = flr(rnd(5))
end

function _draw()
  circfill(
    circle.x,
    circle.y,
    circle.r,
    circle.c
  )
end