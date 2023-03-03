require("player") --To ensure that the game calls the player file 
require("ball") --To ensure that the game calls the ball file 
require("ai") --To ensure that the game calls the ai file 

function love.load() --Function to load the player, ball, and AI 
  Player:load() --Calls player to load all variables 
  Ball:load() --Calls Ball to load all variables 
  AI:load() --Calls AI to load all variables 

  font = love.graphics.newFont(30) --Font size of the scoreboard text  
  score = { player = 0, ai = 0} -- Score board for the player and AI 
end

function love.update(dt) --Function to call all updates 
  Player:update(dt) --Calls player to update (all of its functions)
  Ball:update(dt) --Calls ball to update (all of its functions)
  AI:update(dt)--Calls AI to update (all of its functions)
end 

function love.draw() --Function to call all draws 
  Player:draw() --Calls to draw player 
  Ball:draw() --Calls to draw Ball 
  AI:draw()  -- Calls to draw AI 
  drawScore() -- Calls to udate score 
end

function drawScore() --Uses the graphics to draw score 
  love.graphics.setFont(font)
  love.graphics.print("Player: ".. score.player, 50, 50)
  love.graphics.print("AI: ".. score.ai, 1000, 50)
end 


function checkCollision(a, b) -- Function to determine collision between ball, player, and AI
  if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then 
    return true -- boolean value is true if 'a' and 'b' are colliding. 
  else 
    return false -- false if they're not colliding. 
  end 
end