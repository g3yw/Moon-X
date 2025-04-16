return [[
    if not game:IsLoaded() then
        repeat task.wait() until game:IsLoaded()
    end

    local Workspace = game:GetService("Workspace")
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer

    repeat task.wait() until Workspace:FindFirstChild("Rendered") and Workspace.Rendered:FindFirstChild("Rifts")

    local Rifts = Workspace.Rendered.Rifts

    if not isfile("Moonx/SelectedRifts.txt") then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
        return
    end

    local SelectedRiftsRaw = readfile("Moonx/SelectedRifts.txt")

    if SelectedRiftsRaw == "none" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
        return
    end

    local Found = false

    for Line in SelectedRiftsRaw:gmatch("[^\r\n]+") do
        local Rift = Rifts:FindFirstChild(Line)
        if Rift then
            if string.find(Line, "egg") then
                local Display = Rift:FindFirstChild("Display")
                local SurfaceGui = Display and Display:FindFirstChild("SurfaceGui")
                local Icon = SurfaceGui and SurfaceGui:FindFirstChild("Icon")
                local LuckLabel = Icon and Icon:FindFirstChild("Luck")
                local Luck = LuckLabel and LuckLabel.Text

                if Line ~= "aura-egg" and Luck == "x25" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                    Found = true
                    break
                end
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                Found = true
                break
            end
        end
    end

    if not Found then
        local LastTeleportTime = os.time()
        local function CanTeleport()
            return os.time() - LastTeleportTime >= 10
        end

        if CanTeleport() then
            local Data = loadstring(game:HttpGet("https://raw.githubusercontent.com/g3yw/Moon-X/refs/heads/main/erm.lua"))()
            queue_on_teleport(Data)
            task.wait(5)

            local Success, ErrorMessage = pcall(function()
                TeleportService:TeleportAsync(game.PlaceId, {Player})
            end)

            if Success then
                LastTeleportTime = os.time()
            end
        end
    end
]]
