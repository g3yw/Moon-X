return [[
    if not game:IsLoaded() then
        repeat task.wait() until game:IsLoaded()
    end

    local Workspace = game:GetService("Workspace")
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")
    local Player = Players.LocalPlayer

    repeat task.wait() until Workspace:FindFirstChild("Rendered") and Workspace.Rendered:FindFirstChild("Rifts")

    local Rifts = Workspace.Rendered.Rifts

    if isfile("Moonx/SelectedRifts.txt") then
        local SelectedRiftsRaw = readfile("Moonx/SelectedRifts.txt")

        if SelectedRiftsRaw == "none" then         
            (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
            return
        end

        local Found = false

        for Line in SelectedRiftsRaw:gmatch("[^\r\n]+") do
            local Rift = Rifts:FindFirstChild(Line)
            if Rift then
                if string.find(Line, "egg") then
                    local Display = Rift:FindFirstChild("Display")
                    if Display then
                        local LuckLabel = Display:FindFirstChild("SurfaceGui") and Display.SurfaceGui:FindFirstChild("Icon") and Display.SurfaceGui.Icon:FindFirstChild("Luck")
                        local Luck = LuckLabel and LuckLabel.Text
                        if Line ~= "aura-egg" and Luck == "x25" then
                            (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                            Found = true
                            break
                        else
                            continue
                        end
                    end
                else
                    (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                    Found = true
                    break
                end
            end
        end

        if Found == false then
            queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/g3yw/Moon-X/refs/heads/main/test.lua"))
            TeleportService:Teleport(game.PlaceId, Player)
        end
    else
        (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
        return
    end
]]

-- If your looking at this, ts sloppy asf bc its rushed. Works though 🤷‍♂️
