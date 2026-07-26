-- Kohl-admin-house-destuctor 2
local chatEvent = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local player = players.LocalPlayer
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

    -- 🌋 [MEGA LONG MATRIX TEXT - สแปมประกาศข้อความกลางจอยาวเหยียดระดับล้างเผ่าพันธุ์]
    "/m ☠️☠️☠️ CRITICAL WARNING PROTOCOL: THE ENTIRE SERVER SERVICE REALM HAS BEEN COMPLETELY DESTROYED AND OVERLOADED BY THE SUPREME INJECTOR SYSTEM OF DARK KOHLS EDITION V4.",
    "/m ⚡⚡⚡ HARDWARE INFRASTRUCTURE FAILURE DETECTED ON SYSTEM HOST INCOMING EXCEPTION: ERROR BAD_ALLOC BUFFER OVERFLOW - ALL REPLICATED DATA AND REPLICATED STORAGE REJECTED.",
    "/m 🌐🌐🌐 [!] UNRECOVERABLE DESYNC AND ENGINE CORRUPTION DETECTED [!] CLIENT INTERFACE BLOCKED BY EXECUTIVE PRIVILEGES - CORE SCRIPTS ARE SHUTTING DOWN.",
    "/m 💥💥💥 BOOM CRASH APOCALYPSE ACTIVATED BY DARK KOHLS ULTIMATE DESTROYER SYSTEM PIPELINE INJECT - NO ONE IN THIS SERVER HAS AUTHORITY TO RESPOND.",

    -- 📡 [MEGA LONG MATRIX TEXT - สแปมแถบอักษรวิ่งด้านบนยาวเหยียดเพื่อทำลายเมนู UI หน้าจอทั]
    "/h ==================================================================================================================================================================================",
    "/h [!] ERROR LOG: MAXIMUM REPLICATED STORAGE QUEUE EXCEEDED LIMITATION - TOTAL SYSTEM CRASH INBOUND.",
    "/h [!] LIGHTING SERVICE LOG: AMBIENT VALUES FORCED OVERRIDE BY EXECUTOR INJECTOR - EXTREME BRIGHTNESS APPLIED.",
    "/h [!] NETWORK ENGINE LOG: HIGH INCOMING DATA STREAMS INJECTED SUCCESSFULLY VIA HEARTBEAT FRAME RATES REDUCED TO ZERO.",
    "/h ==================================================================================================================================================================================",

    -- 🎭 [ULTRA MAXIMUM COMMANDS CHAIN - มหากาพย์ขยายคำสั่งวนลูปแกล้งคน สกิน แสง สี เสียง ทั้งหม�]
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
    
    -- 📡 [ADDITIONAL MAXIMUM LENGTH CHAINS - เพิ่มส่วนขยายคำสั่งวนลูปแอดมินทุกสายเพื่อเพิ่มตัวอ��]
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

    -- 🌌 [DEEP EXPANSION: ส่วนขยายเพิ่มเติมพิเศษเพื่อเพิ่มปริมาณดาต้าและคำสั่งให้ยา...]
    "/gravity all 0", "/gravity all 1000", "/gravity all 196.2", "/gravity all 50",
    "/material all fabric", "/material all diamondplate", "/material all plastic", "/material all woodplanks",
    "/paint all hot pink", "/paint all deep orange", "/paint all industrial white", "/paint all tooth yellow",
    "/color all tooth yellow", "/color all deep orange", "/color all hot pink", "/color all baby blue",
    "/size others 10", "/size others 5", "/size others 2", "/size others 0.5",
    "/sparkles all", "/fire all", "/smoke all", "/ff all", "/light all",
    "/undance all", "/unwave all", "/uncheer all", "/unlaugh all", "/unpoint all", "/unshrekhands all", "/unturkey all", "/unchicken all", "/unduck all", "/unpig all", "/uncow all", "/unhorse all", "/unsheep all"
}

-- commands table fixed: all strings closed and table terminated
