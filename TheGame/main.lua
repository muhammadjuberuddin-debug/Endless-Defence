function love.load()
    -- The Player
    Player = {x = 100, y = 100, width = 25, height = 25, speed = 250}

    -- Attack of player
    Attack = {state = false, timer = 0, duration = 0.3, radius = 30}

    -- The Score
    Score = 0
end

-- FUNCTIONS
love.keypressed = function(key) if key == "space" or key == "return" then Attack.state = true; Attack.timer = Attack.duration end end

function love.update(dt)
        -- The Player Movement
        if love.keyboard.isDown("w", "up") then Player.y = Player.y - Player.speed * dt end
        if love.keyboard.isDown("s", "down") then Player.y = Player.y + Player.speed * dt end
        if love.keyboard.isDown("a", "left") then Player.x = Player.x - Player.speed * dt end
        if love.keyboard.isDown("d", "right") then Player.x = Player.x + Player.speed * dt end
        --The Player Limits
        if Player.x < 1 then Player.x = 1 end
        if Player.y < 1 then Player.y = 1 end
        if Player.x > 852 - Player.width then Player.x = 852 - Player.width end
        if Player.y > 478 - Player.height then Player.y = 478 - Player.height end
        -- The Attack Update
        if Attack.state then Attack.timer = Attack.timer - dt; if Attack.timer <= 0 then Attack .state = false end end
end

function love.draw()
    -- The Border Around Screen
    love.graphics.setColor(0,1,0,1)
    love.graphics.rectangle("line", 1, 1, 852, 478)

    -- The Player Drawing
    love.graphics.setColor(0,1,0,1)
    love.graphics.rectangle("fill", Player.x, Player.y, Player.width, Player.height)

    -- The Attack Drawing
    if Attack.state then love.graphics.setColor(1,1,1,1);
    local centerX = Player.x + Player.width  / 2; 
    local centerY = Player.y + Player.height / 2;
    love.graphics.circle("line", centerX, centerY, Attack.radius)
    end

    -- The Score
    love.graphics.setColor(0,1,0,1)
    love.graphics.print("Score: " .. Score, 10, 10)
end