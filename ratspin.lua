-- skidded by Ratest#6186
-- b3
local mnSpeed = 6
local mnRadius = 2
local defHeight = -2.5
local reachVal = 12

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
     Title = "ratspin",
     Style = 3,
     SizeX = 200,
     SizeY = 320,
     Theme = "Dark"
})

local MainPage = UI.New({
    Title = "Hat Stuff"
})

local SFOTHPage = UI.New({
    Title = "SFOTH IV"
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
    Text = "Reach (EQUIP SWORD)",
    Callback = function()
		local sword = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
		local hum = game.Players.LocalPlayer.Character.Humanoid
		hum:UnequipTools()
		swdr = game.Players.LocalPlayer.Backpack[sword.Name]
		a=Instance.new("SelectionBox",swdr.Handle)
		a.Adornee=swdr.Handle
		swdr.Handle.Massless = true
		swdr.Handle.Size     = Vector3.new(reachVal,reachVal,reachVal)
    end
})
SFOTHPage.Slider({
	Text = "Cubic Reach",
    Callback = function(Value)
        reachVal = Value
    end,
    Min = 1,
    Max = 1000,
    Def = 12
})
OtherPage.Button({
    Text = "Respawn",
    Callback = function()
		local char = game.Players.LocalPlayer.Character
		if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
		char:ClearAllChildren()
		local newChar = Instance.new("Model")
		newChar.Parent = workspace
		game.Players.LocalPlayer.Character = newChar
		wait()
		game.Players.LocalPlayer.Character = char
		newChar:Destroy()
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
-- ffs update pls
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
ScriptPage.Button({
	Text = "Punch Fling",
	Callback = function()
		loadstring(game:HttpGet(('https://pastebin.com/raw/YPZ0wNaw'),true))()
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
    Text = "Speed",
    Callback = function(Value)
        mnSpeed = Value
    end,
    Min = -180,
    Max = 180,
    Def = 6
})
local MinRadius = MainPage.Slider({
    Text = "Radius",
    Callback = function(Value)
        mnRadius = Value
    end,
    Min = 1,
    Max = 50,
    Def = 5
})
local Height = MainPage.Slider({
    Text = "Height",
    Callback = function(Value)
        defHeight = Value
    end,
    Min = -2,
    Max = 10,
    Def = 0
})

MainPage.Button({
	Text = "Big Hat (click 1+ times)",
	Callback = function()
		local Hat = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Accessory")
		Hat.Handle.OriginalSize:Destroy()
		Hat.Parent = workspace
		firetouchinterest(Hat:WaitForChild("Handle"),game.Players.LocalPlayer.Character.Head,0)
	end
})

MainPage.Button({
    Text = "FE Build",
	Callback = function()
		loadstring(game:HttpGet("https://ssbtools.netlify.app/newscript.txt"))()
	end
})

MainPage.Button({
    Text = "Place Hat",
    Callback = function()
		PlaceHat()
    end
})

MainPage.Button({
	Text = "Hat Removal Tool",
	Callback = function()
		local plr = game:GetService("Players").LocalPlayer
		local mouse = plr:GetMouse()

		local tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.Name = "Hat Removal Tool"

		tool.Activated:Connect(function()
		if mouse.Target ~= nil then
			if(mouse.Target.Parent.ClassName == "Accessory") then
				local mT = mouse.Target
				mT:remove()
			end
		end
		end)

		tool.Parent = plr.Backpack
	end
})

MainPage.Button({
	Text = "Drop Hats",
	Callback = function()
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) then
				v.Parent = workspace
			end
		end
	end
})

function doHairSpin()
-- Your nickname
local NICKNAME = game.Players.LocalPlayer.Name

local hat = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Accessory")
-- Default: 0-360
local angle = 0
-- Remove mesh if enabled
if(RemoveMesh:GetState()) then hat.Handle.Mesh:remove() end
-- something attach
	hat.Handle.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0);
	hat.Handle.CanCollide = false;
	hat.Handle:BreakJoints();
	local still = Instance.new('BodyAngularVelocity', hat.Handle);
	still.MaxTorque = Vector3.new(math.huge, math.huge, math.huge);
	still.AngularVelocity = Vector3.new(0, 0, 0);
	local align = Instance.new('AlignPosition', hat.Handle);
	align.MaxForce = 1000000;
	align.MaxVelocity = math.huge;
	align.RigidityEnabled = false;
	align.ApplyAtCenterOfMass = true;
	align.Responsiveness = 200;
	local a0 = Instance.new('Attachment', hat.Handle);
	local a1 = Instance.new('Attachment', game:GetService("Players").LocalPlayer.Character.Head);
	align.Attachment0 = a0;
	align.Attachment1 = a1;
-- Unattach the hat
hat.Parent = game.Workspace
while(game.Workspace:FindFirstChild(NICKNAME)) do
    wait(0.01)
    local player = game.Players.LocalPlayer
    local TorsoPos = player.Character.Torso.Position
    if(angle > 359) then angle = 0 end
    angle = angle + mnSpeed
    local xF = mnRadius * math.cos(math.rad(angle))
    local zF = mnRadius * math.sin(math.rad(angle))
    a1.CFrame = CFrame.new(Vector3.new(xF, defHeight, zF)) * CFrame.fromEulerAnglesXYZ(0, 0, 0)
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
 
                P.BrickColor = BrickColor.Black()
 
                P.Parent = game.Workspace
 
        end
 
end
end

function PlaceHat()
local Player = game:GetService("Players").LocalPlayer
local Char = Player.Character
local HatToPlace = Char:FindFirstChildOfClass("Accessory")
local mouse = Player:GetMouse()
local what = {}

-- trans meaning transparent not transgender
local TransHat = HatToPlace.Handle:Clone()
TransHat.Transparency = 0.1
TransHat.Parent = game.Workspace
TransHat.CanCollide = False

local DidNotPlaceYet = true
local hatPos = mouse.Hit.Position

while(DidNotPlaceYet) do
    wait(0.02)
    TransHat.Position = mouse.Hit.Position
    mouse.Button1Down:Connect(function()
        if(DidNotPlaceYet) then
        TransHat:remove()
        hatPos = mouse.Hit.Position
        HatToPlace.Parent = game.Workspace
        DidNotPlaceYet = false
        end
    end)
end

while(HatToPlace.Parent == game.Workspace) do
    wait(0.02)
    HatToPlace.Handle.Position = hatPos
end
end