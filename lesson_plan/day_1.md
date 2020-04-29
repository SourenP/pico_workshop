- Intro
	- Self
	- Students
		- Say X about yourself
- Introduce PICO-8
	- Showcase games
	- Showcase visuals
- Dive in!
	- Everyone open PICO-8 and share your screen
	- Navigation
	    - LS, CD, MKDIR, HELP, CLS
	- Splore
	- Editor
	    - Code, Sprite, Map, Sound, Music
- First Code
	- Draw single
		- Shapes, Sprites, Sounds
		- ```lua
		  function _draw()
			cls()
			circfill(64,64,6,9)		
			spr(1, 60, 80)
		    sfx(0)
		  end
		  ```
	- Draw Loop
		- For loop
		- ```lua
		  function _draw()
			cls()
			for i=1,10 do
			  circfill(i*10,i*10,i,i)
			end		
		  end
		  ```
	- Draw Table
		- Table (map)
		- ```lua
			function _init()
			  c = {
			    x = 40,
			    y = 60,
			    r = 10,
			    c = 9,
			    kapik=24
			  }
			end
			
			function _draw()
			  cls()
			  circfill(c.x,c.y,c.r,c.c)
			end
		  ```
		- Table (array)
		- ```lua
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
			  -- or add(cirlces,c1)
			end
			
			function _draw()
			  cls()
			  for c in all(circles) do
			    circfill(c.x,c.y,c.r,c.c)
			  end
			end
		```
	- Draw Update
    	- _update, rnd, flr
	    - ```lua
			function _init()
			  -- cls()
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
	      ```
  - Commands
    - SAVE, LOAD, RUN
- Homework
  - Draw a pretty picture using _init, _update, _draw, tables, shapes
