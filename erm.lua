return [[
        if not game:IsLoaded() then
            repeat task.wait() until game:IsLoaded()
        end

        local Workspace = game:GetService("Workspace")
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local HttpService = game:GetService("HttpService")

        local function GetServerId()
            local CurrentJob = game.JobId

            local Response = request({
                Url = "http://127.0.0.1:5000/get_new_serv",
                Method = "POST",
                Body = '{"current_jobid": "'..CurrentJob..'"}',
                Headers = {
                    ['Content-Type'] = 'application/json',
                }
            })

            if Response.Body ~= "false" then
                return Response.Body
            else
                return CurrentJob
            end
        end

        if Workspace:FindFirstChild("Rendered") then
            local Rifts = Workspace:FindFirstChild("Rendered"):FindFirstChild("Rifts")
            
            if not Rifts then
                repeat task.wait() until Workspace:FindFirstChild("Rendered"):FindFirstChild("Rifts")
            end

            Rifts = Workspace:FindFirstChild("Rendered"):FindFirstChild("Rifts")

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
                            print("[MoonX] Matching rift found: " .. Line)
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                            Found = true
                            break
                        end
                    end
                end

                local NewServer = GetServerId()

                if Found == false then
                    if NewServer == game.JobId then
                        (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
                        return
                    else
                        queue_on_teleport(loadstring(game:HttpGet("https://raw.githubusercontent.com/g3yw/Moon-X/refs/heads/main/erm.lua"))())
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, NewServer, Players.LocalPlayer)
                    end
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
