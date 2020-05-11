pico-8 cartridge // http://www.pico-8.com
version 22
__lua__
--init
function _init()
  --player table
  player={
    x = 60,
    y = 60,
    c = 9,
    r = 2,
    speed = 1.5,
  }


  --game settings
  enemies = {}
  max_enemies = 12
  max_enemy_size = 6
  enemy_speed = 0.6
  points = 0
end

-->8
--draw
function _draw()
  cls()

  --player
  circfill(player.x,player.y,player.r,player.c)
  circ(player.x,player.y,player.r+1,player.c+1)
end

-->8
--update
function _update()
  --player movement
  if btn(0) then player.x -= player.speed end
  if btn(1) then player.x += player.speed end
  if btn(2) then player.y -= player.speed end
  if btn(3) then player.y += player.speed end

  --flip sides
  if player.x > 127 then player.x = 1 end
  if player.x < 0 then player.x = 126 end
  if player.y > 127 then player.y = 1 end
  if player.y < 0 then player.y = 126 end

  -- create enemies
  create_enemies()

  -- move enemies
end

-->8
--enemies
function create_enemies()
  if #enemies < max_enemies then
  --make enemy table
    local enemy = {
      x = 0,
      y = 0,
      speed_x = enemy_speed,
      speed_y = enemy_speed,
      r = flr(rnd(max_enemy_size))+1,
      c = flr(rnd(15))+1
    }

    --random start position and speed
    place = flr(rnd(4))
    if place == 0 then
      --left
      enemy.x = -8
      enemy.y = flr(rnd(128))
      enemy.speed_x = enemy.speed_x
      enemy.speed_y = 0
    elseif place==1 then
      --right
      enemy.x = 128+8
      enemy.y = flr(rnd(128))
      enemy.speed_x = -enemy.speed_x
      enemy.speed_y = 0
    elseif place==2 then
      --top
      enemy.x = flr(rnd(128))
      enemy.y = -8
      enemy.speed_x = 0
      enemy.speed_y = enemy.speed_y
    elseif place==3 then
      --bottom
      enemy.x = flr(rnd(128))
      enemy.y = 128+8
      enemy.speed_x = 0
      enemy.speed_y = -enemy.speed_y
    end

    --add it to enemies table
    add(enemies,enemy)
  end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
