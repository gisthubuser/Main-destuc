    -- Kohl-admin-house-destuctor 2 (fixed for modern TextChatService)
local chatEvent = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local player = players.LocalPlayer
local textChatService = game:GetService("TextChatService")

local commands = {
    "/infect all", "/setmessage LOLLL NOOB", "/respawn all", "/brightness 10000000000",
    "fogend 1", "/sm hey men", "/time 0", "/fire all",
    "/smoke all", "/ff all", "/sparkles all", "/trip all",
    "/seizure all", "/music 111044390005146", "/gun all", "/fling all",
    "/dog all", "/flashify all", "/clone all", "/h hi",
    "/removelimbs all", "/shiny all", "/minihead all", "/bighead all",
    "noobify all", "/creeper all", "/disco", "/damage all 100",
    "/m e", "/explode all", "/skydive all", "/freeze all",
    "/blind all", "/jail all", "/stun all", "/kill all",

    "/unanchor all", "/glitch all", "/size all 0.1", "/naked all",
    "/control all", "/lockall", "/loopkill all", "/crash",
    "/shutdown", "/clear", "/nil all", "/void all", "/delete terrain",
    "/punish all", "/decapitate all", "/slock", "/kick others",
    "/permban others", "/ban others", "/superfling all", "/removejoints all",
    "/cleardebris", "/deleteterrain", "/lag all",

    "/watch others", "/view others", "/unview all", "/fixcamera all",
    "/freezecamera all", "/thawcamera all", "/glitchcamera all", "/attachcamera all",
    "/firstperson all", "/thirdperson all", "/maxfov all", "/minfov all",
    "/fov all 120", "/fov all 1", "/camerapart all", "/lockcamera all",

    ":regen", ":swagify all", ":respawn all", ":clean", ":fix",

    "/unanchor admin pad", "/explode admin pad", "/punish admin pad",

    "/m SYSTEM ALERT",
    "/m HARDWARE FAILURE",
    "/m DESYNC DETECTED",
    "/m APOCALYPSE ACTIVATED",

    "/h ================================",
    "/h ERROR LOG",
    "/h LIGHTING OVERRIDE",
    "/h NETWORK OVERLOAD",
    "/h ================================",

    "/paint all neon", "/paint all lime green", "/paint all really red", "/paint all electric blue",
    "/material all neon", "/material all glass", "/material all forcefield", "/material all foil",
    "/color all institutional white", "/color all really black", "/color all crimson", "/color all pastel violet",
    "/transparency all 0.5", "/transparency all 0", "/transparency all 0.9", "/transparency all 1",
    "/sit all", "/jump all", "/platformstand all", "/ragdoll all", "/unragdoll all",
    "/ghost all", "/unghost all", "/invisible all", "/visible all", "/ff others", "/unff others",
    "/sparkles others", "/unsparkles others", "/fire others", "/unfire others", "/smoke others", "/unsmoke others",
    "/btools others", "/undog all", "/unclown all", "/normalhead all", "/normaltools all",
    "/stature all 10", "/stature all 0.1", "/weight all 10000", "/weight all 0",
    "/speed others 0", "/speed others 250", "/jumppower others 0", "/jumppower others 1000",
    "/noclip all", "/clip all", "/fly all", "/unfly all", "/swim all", "/unswim all",
    "/pbar all", "/char all 0", "/gchar all 0", "/package all 0", "/headless all",
    "/melt all", "/freeze all", "/thaw all", "/burn all", "/extinguish all",
    "/infect all", "/cure all", "/zombie all", "/vampire all", "/human all",
    "/particles all", "/unparticles all", "/beams all", "/unbeams all", "/trails all", "/untrails all",
    "/light all", "/unlight all", "/neon all", "/uneon all", "/forcefield all", "/unforcefield all",
    "/robloxall", "/nooball", "/guestall", "/baconall", "/derpall", "/scaryall",
    "/boxall", "/sphereall", "/cylinderall", "/wedgeall", "/torusall",
    "/bighead others", "/minihead others", "/giant others", "/tiny others",
    "/spin others", "/unspin others", "/rocket others", "/unrocket others",
    "/jail others", "/unjail others", "/kidnap others", "/release others",
    "/drown all", "/undrown all", "/suffocate all", "/unsuffocate all",
    "/electrocute all", "/unelectrocute all", "/poison all", "/unpoison all",
    "/blind others", "/unblind others", "/deaf others", "/undeaf others",
    "/mute others", "/unmute others", "/clone others", "/unclone others",
    "/slowall", "/fastall", "/normalall", "/glitchall", "/unglitchall",
    "/wither all", "/unwither all", "/decay all", "/undecay all",
    "/corrupt all", "/uncorrupt all", "/infectious all", "/uninfectious all",
    "/apocalypse", "/armageddon", "/ragnarok", "/cataclysm", "/extinction",
    "/wipetools all", "/clearbackpack all", "/removetools all", "/strip all",
    "/reset all", "/respawn all", "/refresh all", "/loadall", "/reloadall",
    "/kickall", "/banall", "/permbanall", "/crashall", "/shutdownall",

    "/name others DESTROYED", "/name all TARGET", "/name admin pad BROKEN",
    "/confuse all", "/unconfuse all", "/blur all", "/unblur all",
    "/screencolor all red", "/screencolor all black", "/screencolor all green", "/screencolor all normal",
    "/invert all", "/uninvert all", "/clone admin pad",
    "/swagify all", "/swagify others", "/sparkles admin pad", "/fire admin pad",
    "/gold all", "/silver all", "/diamond all", "/bronze all",
    "/ice all", "/wood all", "/brick all", "/sand all",
    "/stun others", "/unstun others", "/trippy all", "/untrippy all",
    "/dance others", "/dance all", "/wave all", "/cheer all",
    "/laugh all", "/point all", "/dance2 all", "/dance3 all",
    "/shrekhands all", "/turkey all", "/chicken all", "/duck all",
    "/pig all", "/cow all", "/horse all", "/sheep all",
    "/ufo all", "/car all", "/plane all", "/boat all",
    "/punish others", "/unpunish others", "/nuke all", "/meteor all",
    "/earthquake", "/flood", "/tsunami", "/tornado", "/lightning all",
    "/starve all", "/unstarve all", "/freeze others", "/thaw others",

    "/gravity all 0", "/gravity all 1000", "/gravity all 196.2", "/gravity all 50",
    "/material all fabric", "/material all diamondplate", "/material all plastic", "/material all woodplanks",
    "/paint all hot pink", "/paint all deep orange", "/paint all industrial white", "/paint all tooth yellow",
    "/color all tooth yellow", "/color all deep orange", "/color all hot pink", "/color all baby blue",
    "/size others 10", "/size others 5", "/size others 2", "/size others 0.5",
    "/sparkles all", "/fire all", "/smoke all", "/ff all", "/light all",
    "/undance all", "/unwave all", "/uncheer all", "/unlaugh all", "/unpoint all",
    "/unshrekhands all", "/unturkey all", "/unchicken all", "/unduck all",
    "/unpig all", "/uncow all", "/unhorse all", "/unsheep all"
}

-- Safety/config
local sendInterval = 1 -- seconds between commands (configurable)
local maxPerMinute = 60 -- max messages per 60s window to avoid extreme spam

local isRunning = false
local currentIndex = 1

print("Loaded commands:", #commands)

-- Send function (tries new chat first, falls back to old)
local function sendToChat(msg)
    if not msg or msg == "" then return false end

    -- rate limiting
    if not sendToChat._rate then
        sendToChat._rate = {count = 0, windowStart = tick()}
    end
    local rate = sendToChat._rate
    local now = tick()
    if now - rate.windowStart >= 60 then
        rate.count = 0
        rate.windowStart = now
    end
    if rate.count >= maxPerMinute then
        -- throttled
        warn("Throttling chat sends — reached maxPerMinute")
        return false
    end

    local success, err = pcall(function()
        if textChatService and textChatService.TextChannels then
            local channel = textChatService.TextChannels:FindFirstChild("RBXGeneral")
            if channel and channel.SendAsync then
                channel:SendAsync(msg)
            else
                chatEvent:FireServer(msg, "All")
            end
        else
            chatEvent:FireServer(msg, "All")
        end
    end)

    if success then
        rate.count = rate.count + 1
        return true
    else
        warn("Failed to send chat:", err)
        -- fallback attempt
        pcall(function() chatEvent:FireServer(msg, "All") end)
        return false
    end
end

-- Chat command handler
local function onChatted(msg)
    if type(msg) ~= "string" then return end
    local lowerMsg = msg:lower()

    if lowerMsg == "/start" then
        isRunning = true
        currentIndex = 1
        print("Spam started!")
        sendToChat("/m Spam activated")
    elseif lowerMsg == "/stop" then
        isRunning = false
        print("Spam stopped!")
        sendToChat("/m Spam deactivated")
    elseif lowerMsg:sub(1, 6) == "/send " then
        local customMsg = msg:sub(7)
        sendToChat(customMsg)
        print("Sent →", customMsg)
    end
end

-- Ensure player is available before connecting
if not player then
    -- In some contexts LocalPlayer isn't immediately available; try waiting briefly
    local start = tick()
    while not player and tick() - start < 5 do
        player = players.LocalPlayer
        task.wait(0.1)
    end
end

if player then
    player.Chatted:Connect(onChatted)
    players.PlayerRemoving:Connect(function(p)
        if p == player then
            isRunning = false
        end
    end)
else
    warn("LocalPlayer not found — chat commands won't be connected")
end

-- Main loop: use Heartbeat with accumulator to respect sendInterval
local accumulator = 0
runService.Heartbeat:Connect(function(dt)
    accumulator = accumulator + dt
    if isRunning and accumulator >= sendInterval then
        accumulator = accumulator - sendInterval
        local cmd = commands[currentIndex]
        if cmd then
            local sent = sendToChat(cmd)
            if sent then
                print("Sent →", cmd)
            end
        end

        currentIndex = currentIndex + 1
        if currentIndex > #commands then
            currentIndex = 1
        end
    end
end)

print("Script initialized")
