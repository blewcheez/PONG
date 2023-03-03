AI = {}


function AI:load() --Load All variables for the AI 
  self.width = 20 
  self.height = 100
  self.x = love.graphics.getWidth() - self.width - 50 
  self.y = love.graphics.getHeight() / 2 
  self.yVel = 0 
  self.speed = 500 

  self.timer = 0 
  self. rate = 0.5 
end 

function AI:update(dt) -- Update all functionality of the AI 
  self:move(dt)
  self.timer = self.timer + dt
  if self.timer > self.rate then 
     self.timer = 0 
  self:aquireTarget()
  end
  self:checkBoundaries()
  
end 


function AI:move(dt) --AI moveablility 
  self.y = self.y + self.yVel * dt 
end 

function AI:aquireTarget() --AI ability to track the ball 
  if Ball.y + Ball.height < self.y then 
      self.yVel = -self.speed
  elseif Ball.y > self.y + self.height then 
      self.yVel = self.speed
  else 
      self.yVel = 0 
  end 
end 

function AI:checkBoundaries() -- Check the boundaries of the wall 
  
  if self.y < 0 then 
    self.y = 0 
  elseif self.y + self.height > love.graphics.getHeight() then 
    self.y = love.graphics.getHeight() - self.height
  end
end 


function AI:draw() --Draw the AI's rectangle 
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

end 