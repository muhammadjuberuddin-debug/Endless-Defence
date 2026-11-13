function love.load()
    math.randomseed(os.time())
    -- The Player
    Player = {x = 100, y = 100, width = 25, height = 25, speed = 250}

    -- Attack of player
    Attack = {state = false, timer = 0, duration = 0.3, radius = 30}

    -- Enemies
    Enemies = {
        Enemy1 = {
            active = true,
            speed = 200, 
            radius = 10, 
            x = math.random(20, 852), 
            y = math.random(20, 478)
        },
        Enemy2 = {
            active = true,
            speed = 200, 
            radius = 10, 
            x = math.random(20, 852), 
            y = math.random(20, 478)
        },
        Enemy3 = {
            active = true,
            speed = 200, 
            radius = 10, 
            x = math.random(20, 852), 
            y = math.random(20, 478)
        }
    }
    
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

    -- Enemy Drawing
    love.graphics.setColor(1,0,0,1)
    love.graphics.circle("fill", Enemies.Enemy1.x, Enemies.Enemy1.y, Enemies.Enemy1.radius)

    love.graphics.setColor(1,0,0,1)
    love.graphics.circle("fill", Enemies.Enemy2.x, Enemies.Enemy2.y, Enemies.Enemy2.radius)

    love.graphics.setColor(1,0,0,1)
    love.graphics.circle("fill", Enemies.Enemy3.x, Enemies.Enemy3.y, Enemies.Enemy3.radius)

    -- The Score
    love.graphics.setColor(0,1,0,1)
    love.graphics.print("Score: " .. Score, 10, 10)
end