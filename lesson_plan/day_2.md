# Day 2

## Overview

Make our first game!

## Plan

### Hello

- How is everyone doing?
- Reminder of names :)

### Share homework

- Take turns sharing what we made!
    - Did we get stuck?
    - Any questions?

### First game

#### Intro

- Now that we know how to draw, if we add interactivity - we'll have our first game!
- We're going to make a game where you collect dropping fruit

#### Fruit Drop

- Follow slightly modified fruit drop tutorial
    - [nerdyteachers:: FruitDrop Tutorial](https://nerdyteachers.com/Explain/FruitDrop/)
    - _Disclaimer: I didn't make this tutorial. It was made by [nerdyteachers](nerdyteachers.com) and all credit goes to them!_

##### Setup variables

- Sprite numbers
- Player position

```lua
basket_sprite=1
player_sprite=2
fruit_sprite=3

player_x=64
player_y=100
```

![player_pos](images/player_pos.png)

#### Draw sprites

- Go into the sprite editor and make the sprites
    - [1] Basket
    - [2] Player
    - [3] Fruit

#### More variables

```lua
fruits={}
fruit_interval=16
fruit_count=4

gravity=1
points=0
```

#### Game loop

Most games have this loop
    - init: setup game
    - update: make changes
        - 30/sec in pico-8
    - draw: draw new frame
        - 30/sec in pico-8

```lua
function _init()

end

function _update()

end

function _draw()

end
```

#### Draw Player, Basket, Ground

```lua
function _draw()
  cls()
  rectfill(0,108,127,127,3)
  spr(player_sprite,player_x,player_y)
  spr(basket_sprite,player_x,player_y-8)
end
```

![basket_pos](images/basket_pos.png)
![draw_ground](images/draw_ground.png)

- Run game!
    - Should see player, basket and floor

#### Player controls

- Introduce if statement

```lua
function _update()
  if btn(0) then player_x-=2 end
  if btn(1) then player_x+=2 end
end
```

![player_move](images/player_move.png)

- Run game!
    - Should be able to move player

- Modification:
    - Let's make the player not be able to leave the screen!

```lua
function _update()
  if btn(0) then
    if player_x > 0 then
      player_x-=2
    end
  end

  if btn(1) then
    if player_x < 128 then
      player_x+=2
    end
  end
end
```

- Run game!
    - Player shouldn't be able to leave screen on the left
    - Why is the player going off screen on the right?

- Modification
    - Let's keep all of the player on screen.
    - Let's use `and` in `if` statement

```lua
function _update()
  if btn(0) and player_x > 2 then
      player_x-=2
  end

  if btn(1) and player_x < 128 - 8 then
      player_x+=2
  end
end
```

#### Create the fruit

```lua
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
```

#### Update the fruit

```lua
function _update()
  -- ...
  for fruit in all(fruits) do
    fruit.y+=gravity
  end
end

function _draw()
  -- ...
  for fruit in all(fruits) do
    spr(fruit.sprite,fruit.x,fruit.y)
  end
end
```

- Run game!
    - Should see 4 fruit fall


#### Catch fruit

```lua
function _update()
  for fruit in all(fruits) do
    fruit.y+=gravity
    if fruit.y+4>=player_y-8 and
       fruit.y+4<=player_y and
       fruit.x+4>=player_x and
       fruit.x+4<=player_x+8 then
      points+=1
      del(fruits,fruit)
    end
  end
end

```

- Run game!
    - Should be able to catch falling fruit

#### Score points and delete fruit that hit floor

```lua
function _update()
  for fruit in all(fruits) do
    -- ...
    if fruit.y>100 then
        del(fruits,fruit)
    end
  end
end

function _draw()
  -- ...
  print("score= "..points)
end
```

- Run game!
  - Should see score
  - Fruits should disappear when they hit floor

#### Code from today

[fruit_drop.p8](code/fruit_drop.p8)

### Homework
- Change the fruit drop game into your own creation!
    - Some ideas:
        - Add different kinds of fruit each with different score
        - Make rounds of falling fruit
        - Add a poison fruit that makes you lose if you catch it
        - Add a capacity to that basket that you need to empty somewhere
        - Draw more sprites and make more sound effects / music
        - Come up with your own idea!

- Use resources
    - [nerdyteachers:: FruitDrop Tutorial](https://nerdyteachers.com/Explain/FruitDrop/)

### Bye bye

- Bye bye