Ball = {}

function Ball:load() -- Function to load the ball and monitor speed 
self.x = love.graphics.getWidth() / 2 
self.y = love.graphics.getHeight() / 2 
self.width = 20 
self.height = 20 
self.speed = 200
self.xVel = -self.speed
self.yVel = 0 
end 

function Ball:update(dt) --Function to call an update to the move and collide function
  self:move(dt)
  self:collide()
end

function Ball:collide() -- Function that handles all collision (wall, player, AI)
  self:collideWall()
  self:collidePlayer()
  self:collideAI()
  self:score()
end 

function Ball:collideWall() --Wall collision function
  if self.y < 0 then 
      self.y = 0 
      self.yVel = -self.yVel
  elseif self.y + self.height > love.graphics.getHeight() then 
      self.y = love.graphics.getHeight() - self.height
      self.yVel = -self.yVel
  end 
end 

function Ball:collidePlayer() --Player collision function
  if checkCollision(self, Player) then 
    self.xVel = self.speed
    local middleBall = self.y + self.height / 2 
    local middlePlayer = Player.y + Player.height / 2 
    local collisionPosition = middleBall - middlePlayer
    self.yVel = collisionPosition * 5
  end 
end 

function Ball:collideAI() -- AI collision function

  if checkCollision(self, AI) then 
    self.xVel = -self.speed
    local middleBall = self.y + self.height / 2 
    local middleAI = AI.y + AI.height / 2 
    local collisionPosition = middleBall - middleAI
    self.yVel = collisionPosition * 5
  end 
end 

function Ball:score() -- Score function
  if self.x < 0 then  -- If the ball overstreches player side
    self:resetPosition(1)
    score.ai = score.ai + 1 
  end 

  if self.x + self.width > love.graphics.getWidth() then  --If the ball overstretches AI side
    self:resetPosition(-1)
    score.player = score.player + 1 
  end 
end 

function Ball:resetPosition(modifier) -- Ball reset function 
  self.x = love.graphics.getHeight() / 2 - self.width / 2 
  self.y = love.graphics.getWidth() / 2 - self.height / 2 
  self.yVel = 0 
  self.xVel = self.speed * modifier

end 

function Ball:move(dt) -- To ensure the ball move at a steady pace 
  self.x = self.x + self.xVel * dt 
  self.y = self.y + self.yVel * dt 
end

function Ball:draw()
love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

end