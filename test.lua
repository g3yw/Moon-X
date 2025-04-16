return [[
    if not game:IsLoaded() then
        repeat task.wait() until game:IsLoaded()
    end

    local Workspace = game:GetService("Workspace")
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")
    local Player = Players.LocalPlayer

    print("[MoonX] Waiting for Rendered and Rifts...")
    repeat task.wait() until Workspace:FindFirstChild("Rendered") and Workspace.Rendered:FindFirstChild("Rifts")
    print("[MoonX] Rendered and Rifts found")

    local Rifts = Workspace.Rendered.Rifts

    if not isfile("Moonx/SelectedRifts.txt") then
        print("[MoonX] SelectedRifts.txt not found, loading loader...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
        return
    end

    local SelectedRiftsRaw = readfile("Moonx/SelectedRifts.txt")
    print("[MoonX] SelectedRifts content: " .. SelectedRiftsRaw)

    if SelectedRiftsRaw == "none" then
        print("[MoonX] SelectedRifts is 'none', loading loader...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
        return
    end

    local Found = false

    for Line in SelectedRiftsRaw:gmatch("[^\r\n]+") do
        print("[MoonX] Checking Rift: " .. Line)
        local Rift = Rifts:FindFirstChild(Line)
        if Rift then
            if string.find(Line, "egg") then
                print("[MoonX] Found egg rift: " .. Line)
                local Display = Rift:FindFirstChild("Display")
                local SurfaceGui = Display and Display:FindFirstChild("SurfaceGui")
                local Icon = SurfaceGui and SurfaceGui:FindFirstChild("Icon")
                local LuckLabel = Icon and Icon:FindFirstChild("Luck")
                local Luck = LuckLabel and LuckLabel.Text

                print("[MoonX] Egg Luck value: " .. tostring(Luck))

                if Line ~= "aura-egg" and Luck == "x25" then
                    print("[MoonX] Matching egg found with x25 luck, loading loader...")
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                    Found = true
                    break
                else
                    print("[MoonX] Egg did not match criteria")
                end
            else
                print("[MoonX] Matching rift found: " .. Line)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                Found = true
                break
            end
        else
            print("[MoonX] Rift not found: " .. Line)
        end
    end

    if not Found then
        print("[MoonX] No matching rift found, teleporting to another server in 5 seconds...")
        queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/g3yw/Moon-X/refs/heads/main/test.lua"))
        task.wait(5)
        TeleportService:Teleport(game.PlaceId, Player)
    end
]]
