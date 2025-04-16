return [[
        if not game:IsLoaded() then
            repeat task.wait() until game:IsLoaded()
        end

        local Workspace = game:GetService("Workspace")
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local HttpService = game:GetService("HttpService")

        if Workspace:FindFirstChild("Rendered") then
            local Rifts = Workspace:FindFirstChild("Rendered"):FindFirstChild("Rifts")

            if isfile("Moonx/SelectedRifts.txt") then
                local SelectedRiftsRaw = readfile("Moonx/SelectedRifts.txt")

                if SelectedRiftsRaw == "none" then         
                    (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                    return
                end

                local Found = false

                for Line in SelectedRiftsRaw:gmatch("[^\r\n]+") do
                    if Rifts:FindFirstChild(Line) then
                        if string.find(Line, "egg") then
                            local Display = Rifts:FindFirstChild(Line):FindFirstChild("Display")
                            local Luck = Display:FindFirstChild("SurfaceGui"):FindFirstChild("Icon"):FindFirstChild("Luck").Text
                            if Line ~= "aura-egg" and Luck == "x25" then
                                (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                                Found = true
                                break
                            else
                                continue
                            end
                        else
                            (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                            Found = true
                            break
                        end
                    end
                end

                if Found == false then
                    queue_on_teleport(loadstring(game:HttpGet("https://raw.githubusercontent.com/g3yw/Moon-X/refs/heads/main/test.lua"))())
                    TeleportService:Teleport(game.PlaceId, Player)
                end
            else
                (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                return
            end
        else
            (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
            return 
        end
]]

-- If your looking at this, ts sloppy asf bc its rushed. Works though 🤷‍♂️
