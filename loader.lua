local UserInputService = cloneref(game:GetService("UserInputService"))
local DeviceType = UserInputService.TouchEnabled and "Mobile" or "PC"

if DeviceType == "Mobile" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/g3yw/Moon-X/refs/heads/main/main-mobile.lua"))()
elseif DeviceType == "PC" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/g3yw/Moon-X/refs/heads/main/main.lua")()
end
