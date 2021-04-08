-- skidded by Ratest#6186
local mnSpeed = 6
local mxSpeed = 12
local mnRadius = 2
local mxRadius = 8
local defHeight = -2.5

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
     Title = "ratspin",
     Style = 3,
     SizeX = 200,
     SizeY = 320,
     Theme = "Dark"
})

local MainPage = UI.New({
    Title = "Main"
})

local SFOTHPage = UI.New({
    Title = "SFOTH"
})

local ScriptPage = UI.New({
    Title = "Scripts"
})

local OtherPage = UI.New({
    Title = "Other"
})
SFOTHPage.Button({
    Text = "Remove Abyss Portal",
    Callback = function()
       game.Workspace.Teleporter:remove()
    end
})
SFOTHPage.Button({
    Text = "Remove Music",
    Callback = function()
       game.Players.LocalPlayer:FindFirstChild("BackgroundMusic"):remove()
    end
})
SFOTHPage.Button({
    Text = "Remove Shop",
    Callback = function()
       game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui"):remove() 
    end
})
SFOTHPage.Button({
    Text = "Remove Music Script",
    Callback = function()
       game.Players.LocalPlayer.PlayerScripts:FindFirstChild("Music"):remove()
    end
})
SFOTHPage.Button({
    Text = "Remove Overhead Script",
    Callback = function()
       game.Players.LocalPlayer.PlayerScripts:FindFirstChild("OverheadGUIScript"):remove()
    end
})
SFOTHPage.Button({
    Text = "Baseplate",
    Callback = function()
       makeBaseplate()
    end
})
SFOTHPage.Button({
    Text = "1k reach (EQUIP SWORD)",
    Callback = function()
		local sword = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
		local hum = game.Players.LocalPlayer.Character.Humanoid
		hum:UnequipTools()
		swdr = game.Players.LocalPlayer.Backpack[sword.Name]
		a=Instance.new("SelectionBox",swdr.Handle)
		a.Adornee=swdr.Handle
		swdr.Handle.Massless = true
		swdr.Handle.Size     = Vector3.new(1000,1000,1000)
    end
})
OtherPage.Button({
    Text = "Respawn",
    Callback = function()
		local char = game.Players.LocalPlayer.Character
		local savedPos = char.HumanoidRootPart.Position
		if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
		char:ClearAllChildren()
		local newChar = Instance.new("Model")
		newChar.Parent = workspace
		game.Players.LocalPlayer.Character = newChar
		wait()
		plr.Character = char
		newChar:Destroy()
		wait(3.3)
		print(char.HumanoidRootPart.Position.x .. char.HumanoidRootPart.Position.y .. char.HumanoidRootPart.Position.z)
		print(savedPos.x .. savedPos.y .. savedPos.y)
		char:Move(savedPos)
    end
})
OtherPage.Button({
    Text = "Rejoin",
    Callback = function()
        local tpservice= game:GetService("TeleportService")
        local plr = game.Players.LocalPlayer

        tpservice:Teleport(game.PlaceId, plr)
    end
})
OtherPage.Button({
    Text = "Update",
    Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRatest/ratspin/master/ratspin.lua"))()
    end
})
OtherPage.Dropdown({
    Text = "Credits",
    Callback = function(value)
    end,
    Options = {"Ratest#6186"}
})

ScriptPage.Button({
    Text = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

ScriptPage.Button({
	Text = "Dark Dex",
	Callback = function()
		loadstring(game:HttpGet("https://gist.githubusercontent.com/DinosaurXxX/b757fe011e7e600c0873f967fe427dc2/raw/ee5324771f017073fc30e640323ac2a9b3bfc550/dark%2520dex%2520v4"))()
	end
})

ScriptPage.Button({
    Text = "Click TP Tool",
    Callback = function()
        local plr = game:GetService("Players").LocalPlayer
		local mouse = plr:GetMouse()

		local tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.Name = "Click Teleport"

		tool.Activated:Connect(function()
		local root = plr.Character.HumanoidRootPart
		local pos = mouse.Hit.Position+Vector3.new(0,2.5,0)
		local offset = pos-root.Position
		root.CFrame = root.CFrame+offset
		end)

		tool.Parent = plr.Backpack
    end
})

ScriptPage.Button({
    Text = "Transparency Tool",
    Callback = function()
	    local plr = game:GetService("Players").LocalPlayer
		local mouse = plr:GetMouse()

		local tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.Name = "Part Clip Tool"

		tool.Activated:Connect(function()
		if mouse.Target ~= nil then
			if mouse.Target.CanCollide== false and mouse.Target.Transparency == .5 then     mouse.Target.CanCollide= true 
				mouse.Target.Transparency = 0
			else
				mouse.Target.Transparency = .5 
				mouse.Target.CanCollide = false
			end
		end
		end)

		tool.Parent = plr.Backpack
    end
})
ScriptPage.Button({
    Text = "Remove Tool Mesh",
    Callback = function()
        for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if (v:IsA("Tool")) then
                v.Handle.Mesh:remove()
            end
        end
    end
})
ScriptPage.Button({
    Text = "Remove Hats Mesh",
    Callback = function()
        for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if (v:IsA("Accessory")) then
                if(v.Handle:FindFirstChild("Mesh")) then v.Handle:FindFirstChild("Mesh"):remove() end
                if(v.Handle:FindFirstChild("SpecialMesh")) then v.Handle:FindFirstChild("SpecialMesh"):remove() end
            end
        end
    end
})
ScriptPage.Button({
	Text = "Energize GUI",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/R1MgDiRX", true))()
	end
})

local MainButton = MainPage.Button({
    Text = "Start",
    Callback = function()
       doHairSpin() 
    end
})
local RemoveMesh = MainPage.Toggle({
    Text = "Remove mesh",
    Callback = function(Value)
        RemoveMesh = Value
    end,
    Enabled = false
})
local MinSpeed = MainPage.Slider({
    Text = "Min Speed",
    Callback = function(Value)
        mnSpeed = Value
    end,
    Min = 1,
    Max = 180,
    Def = 6
})
local MaxSpeed = MainPage.Slider({
    Text = "Max Speed",
    Callback = function(Value)
        mxSpeed = Value
    end,
    Min = 1,
    Max = 180,
    Def = 12
})
local MinRadius = MainPage.Slider({
    Text = "Min Radius",
    Callback = function(Value)
        mnRadius = Value
    end,
    Min = 1,
    Max = 50,
    Def = 2
})
local MaxRadius = MainPage.Slider({
    Text = "Max Radius",
    Callback = function(Value)
        mxRadius = Value
    end,
    Min = 1,
    Max = 50,
    Def = 8
})
local Height = MainPage.Slider({
    Text = "Height",
    Callback = function(Value)
        defHeight = Value
    end,
    Min = -2.5,
    Max = 10,
    Def = -2.5
})

local AmountHat = 3

local AmountOfHats = MainPage.Slider({
    Text = "Amount of hats",
    Callback = function(Value)
        AmountHat = Value
    end,
    Min = 1,
    Max = 10,
    Def = 3
})

local AmountMode = MainPage.Button({
    Text = "Amountal",
    Callback = function()
        for i = 1, AmountHat, 1 do
            doHairSpin()
        end
    end
})

function doHairSpin()

-- Your nickname
local NICKNAME = game.Players.LocalPlayer.Name

local hat = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Accessory")
-- Default: 0-360
local angle = 0
-- Default: 3-14
local defRadius = math.random(mnRadius, mxRadius)
-- Default: 2-10
local defSpeed = math.random(mnSpeed, mxSpeed)
-- Remove mesh if enabled
if(RemoveMesh:GetState()) then hat.Handle.Mesh:remove() end
-- Unattach the hat
hat.Parent = game.Workspace
while(game.Workspace:FindFirstChild(NICKNAME)) do
    wait(0.03)
    local player = game.Players.LocalPlayer
    local TorsoPos = player.Character.Torso.Position
    if(angle > 359) then angle = 0 end
    angle = angle + defSpeed
    local xF = TorsoPos.x + defRadius * math.cos(math.rad(angle))
    local zF = TorsoPos.z + defRadius * math.sin(math.rad(angle))
    hat.Handle.Position = Vector3.new(xF, TorsoPos.y + defHeight, zF)
end
end

--[[function travelTo(hatHandle, lx, ly, lz)
    for x = 0, 5 do
        wait(0.009)
        local diffX = lx - hatHandle.Position.x
        local diffY = ly - hatHandle.Position.y
        local diffZ = lz - hatHandle.Position.z
        finalPos = Vector3.new(hatHandle.position.x + diffX/8, hatHandle.position.y + diffY/8, hatHandle.position.Z + diffZ/8) 
        hatHandle.Position = Vector3.new(finalPos.x,finalPos.y,finalPos.z)
    end
end]]

function makeBaseplate()
for X = -2500, 2500, 512 do
 
        for Z = -2500, 2500, 512 do
 
                local P = Instance.new("Part")
 
                P.Anchored = true
 
                P.Locked = true
 
                P.Size = Vector3.new(512,3,512)         -- By Bouyer the Destroyer
 
                P.CFrame = CFrame.new(X,0,Z)
 
                P.BrickColor = BrickColor.Green()
 
                P.Parent = game.Workspace
 
        end
 
end
end

function hairFling()
--script made by kuraga#4659

for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v.ClassName == "Accessory" then v.Parent = workspace
end
end
gh = game.Players.LocalPlayer.Name
game.Workspace[gh]:Destroy()
wait(2)
   spawn(function()
   while wait() do
       sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
       sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", math.huge)
   end
end)
   for i,d in pairs(workspace:GetChildren()) do
     if d:IsA("Accessory") then 
local temp = Instance.new("BodyPosition")
temp.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
temp.Parent = d.Handle
 spawn(function()
   while wait() do
       sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
       sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", math.huge)
   end
end)
local temp1 = Instance.new("BodyThrust")
temp1.Location = Vector3.new(5,0,0)
temp1.Force = Vector3.new(10000,10000,10000)
temp1.Parent = d.Handle
d.Handle.CanCollide = false
game:GetService("RunService").RenderStepped:Connect(function()
d.Handle.Position = game.Players.LocalPlayer:GetMouse().Hit.p + Vector3.new(0,2,0)
temp.Position = game.Players.LocalPlayer:GetMouse().Hit.p + Vector3.new(0,2,0)
end)
end
end
end