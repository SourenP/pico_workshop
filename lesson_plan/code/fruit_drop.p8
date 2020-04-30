basket_sprite=1
player_sprite=2
fruit_sprite=3

player_x=64
player_y=100

fruits={}
fruit_interval=16
fruit_count=4

gravity=1
points=0

function _init()
  for i=1,fruit_count do
    fruit={
      sprite=fruit_sprite,
      x=flr(rnd(120)),
      y=-fruit_interval*i
    }
    add(fruits, fruit)
  end
end

function _update()
  if btn(0) then
    if player_x > 0 then
      player_x-=2
    end
  end

  if btn(1) then
    if player_x < 128 - 8 then
      player_x+=2
    end
  end


  for fruit in all(fruits) do
    fruit.y+=gravity
    if fruit.y+4>=player_y-8 and
       fruit.y+4<=player_y and
       fruit.x+4>=player_x and
       fruit.x+4<=player_x+8 then
      points+=1
      del(fruits,fruit)
    end

    if fruit.y>100 then
      del(fruits,fruit)
    end
  end


end

function _draw()
  cls()
  rectfill(0,108,127,127,3)
  spr(player_sprite,player_x,player_y)
  spr(basket_sprite,player_x,player_y-8)

  for fruit in all(fruits) do
    spr(fruit.sprite,fruit.x,fruit.y)
  end

  print("score= "..points)
end