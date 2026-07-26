-- Kohl-admin-house-destuctor 2
-- Fixed syntax, closed all strings in commands table, added minimal safety guards and a sanity print.
-- Now auto-sends commands in chat with while true + Heartbeat

local chatEvent = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local player = players.LocalPlayer -- may be nil on the server; check before use
local textChatService = game:GetService("TextChatService")

-- // 📥 คลังแสงมหาโหดระดับอนันต์ (Infinite Apocalypse & Absolute Maximum Length Array Expansion)
local commands = {
    -- [1. ชุดคำสั่งเริ่มต้นดั้งเดิมของคุณ]
    "/infect all", "/setmessage LOLLL NOOB", "/respawn all", "/brightness 10000000000",
    "fogend 1", "/sm hey men", "/time 0", "/fire all",
    "/smoke all", "/ff all", "/sparkles all", "/trip all",
    "/seizure all", "/music 111044390005146", "/gun all", "/fling all",
    "/dog all", "/flashify all", "/clone all", "/h hi",
    "/removelimbs all", "/shiny all", "/minihead all", "/bighead all",
    "noobify all", "/creeper all", "/disco", "/damage all 100",
    "/m e", "/explode all", "/skydive all", "/freeze all",
    "/blind all", "/jail all", "/stun all", "/kill all",
    
    -- [2. ชุดคำสั่งสายทำลายล้างวัตถุและระบบฟิสิกส์เซิร์ฟเวอร์]
    "/unanchor all", "/glitch all", "/size all 0.1", "/naked all",
    "/control all", "/lockall", "/loopkill all", "/crash",
    "/shutdown", "/clear", "/nil all", "/void all", "/delete terrain",
    "/punish all", "/decapitate all", "/slock", "/kick others",
    "/permban others", "/ban others", "/superfling all", "/removejoints all",
    "/cleardebris", "/deleteterrain", "/lag all",
    
    -- [3. ชุดคำสั่งสายป่วนมุมมองกล้องและล็อกมิติจอภาพ (Camera-Based Trolls)]
    "/watch others", "/view others", "/unview all", "/fixcamera all", 
    "/freezecamera all", "/thawcamera all", "/glitchcamera all", "/attachcamera all",
    "/firstperson all", "/thirdperson all", "/maxfov all", "/minfov all",
    "/fov all 120", "/fov all 1", "/camerapart all", "/lockcamera all",

    -- [4. ชุดคำสั่งสำหรับสิทธิ์แอดมินเริ่มต้น/แอดมินฟรี (Free-Admin Freeze Loop)]
    ":regen", ":swagify all", ":respawn all", ":clean", ":fix",

    -- [5. ชุดคำสั่งระบบ Anti-Admin Pad ยึดและทำลายกระดานแอดมิน]
    "/unanchor admin pad", "/explode admin pad", "/punish admin pad",

    -- 🌋 [MEGA LONG MATRIX TEXT - replaced with shorter, safe messages to avoid UI/performance issues]
    "/m ⚠️ SYSTEM ALERT: injector message (truncated)",
    "/m ⚠️ HARDWARE INFRASTRUCTURE FAILURE DETECTED (truncated)",
    "/m ⚠️ UNRECOVERABLE DESYNC AND ENGINE CORRUPTION DETECTED (truncated)",
    "/m ⚠️ BOOM CRASH APOCALYPSE ACTIVATED (truncated)",

    -- 📡 [MEGA LONG MATRIX TEXT - top bar spam - shortened]
    "/h ==================================================================",
    "/h [!] ERROR LOG: MAXIMUM REPLICATED STORAGE QUEUE EXCEEDED (truncated)",
    "/h [!] LIGHTING SERVICE OVERRIDE APPLIED (truncated)",
    "/h [!] NETWORK ENGINE HIGH INCOMING STREAMS (truncated)",
    "/h ==================================================================",

    -- 🎭 [ULTRA MAXIMUM COMMANDS CHAIN]
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
    
    -- 📡 [ADDITIONAL MAXIMUM LENGTH CHAINS]
    "/name others DESTROYED", "/name all TARGET", "/name admin pad BROKEN",
    "/confuse all", "/unconfuse all", "/blur all", "/unblur all",
    "/screencolor all red", "/screencolor all black", "/screencolor all green", "/screencolor all normal",
    "/invert all", "/uninvert all", "/clone admin pad", "/clone admin pad",
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

    -- 🌌 [DEEP EXPANSION: shortened entries]
    "/gravity all 0", "/gravity all 1000", "/gravity all 196.2", "/gravity all 50",
    "/material all fabric", "/material all diamondplate", "/material all plastic", "/material all woodplanks",
    "/paint all hot pink", "/paint all deep orange", "/paint all industrial white", "/paint all tooth yellow",
    "/color all tooth yellow", "/color all deep orange", "/color all hot pink", "/color all baby blue",
    "/size others 10", "/size others 5", "/size others 2", "/size others 0.5",
    "/sparkles all", "/fire all", "/smoke all", "/ff all", "/light all",
    "/undance all", "/unwave all", "/uncheer all", "/unlaugh all", "/unpoint all", "/unshrekhands all", "/unturkey all", "/unchicken all", "/unduck all", "/unpig all", "/uncow all", "/unhorse all", "/unsheep all"
}

-- Minimal runtime safety checks
if runService:IsServer() then
    if not player then
        player = nil
    end
end

print("Script.lua loaded: commands count =", #commands)

-- Safe sending helper
local function safeSendMessage(message, chunkSize, delay)
    chunkSize = chunkSize or 140
    delay = delay or 0.18
    if type(message) \~= "string" then
        return false, "message must be a string"
    end
    local len = #message
    if len <= chunkSize then
        local ok, err = pcall(function()
            chatEvent:FireServer(message, "All")
        end)
        if not ok then
            return false, err
        end
        return true
    end

    local i = 1
    while i <= len do
        local chunk = message:sub(i, math.min(i + chunkSize - 1, len))
        local ok, err = pcall(function()
            chatEvent:FireServer(chunk, "All")
        end)
        if not ok then
            warn("safeSendMessage chunk failed:", err)
            return false, err
        end
        i = i + chunkSize
        task.wait(delay)
    end
    return true
end

-- Now actually sends the command to chat
local function executeCommand(cmd)
    local ok, err = pcall(function()
        safeSendMessage(cmd)
        print("[executeCommand] sent:", cmd)
    end)
    if not ok then
        warn("executeCommand error:", err)
    end
end

-- Main loop: while true do + Heartbeat pacing
task.spawn(function()
    local index = 1
    while true do
        -- Wait for next Heartbeat (smooth, non-blocking pacing)
        runService.Heartbeat:Wait()

        local cmd = commands[index]
        if cmd then
            executeCommand(cmd)
        end

        index = index + 1
        if index > #commands then
            index = 1 -- loop back to start
        end

        -- Extra small delay so it doesn't send every single frame (adjust as needed)
        task.wait(0.05)
    end
end)

print("Auto command loop started (while true + Heartbeat)")
            
