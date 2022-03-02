-- FE Neko Maid Animations By Creo
-- Tail that CAN be used https://web.roblox.com/catalog/4645440842/Plain-White-Cat-Tail
-- For updates on script join this server
-- https://discord.gg/ad7WVB6Bxf

--[[
            CONTROLS:

            Left Click: Melee
            R: you lay on the ground
            F: Toggle sprint
            T: Laugh
            Z: you spin upwards
            X: (hover the mouse on someone to work) you teleport to that person and they get flung
]]--

local DummyName = loadstring(game:HttpGet("https://raw.githubusercontent.com/its-asia/animations/main/DummyName.lua", true))()

script = workspace[DummyName]:FindFirstChild('Animate') or workspace[DummyName]:FindFirstChild('Head')

local LocalPlayer = game:GetService("Players").LocalPlayer

local p = LocalPlayer
local char = p.Character
local mouse = p:GetMouse()
local larm = char["Left Arm"]
local rarm = char["Right Arm"]
local lleg = char["Left Leg"]
local rleg = char["Right Leg"]
local hed = char.Head
local torso = char.Torso
local hum = char.Humanoid
local cam = workspace.CurrentCamera
local root = char.HumanoidRootPart
Bypass = "Death"
plr = LocalPlayer
dead = false
char = plr.Character

mouse = plr:GetMouse()
head = char.Head
camera = workspace.CurrentCamera
lt = true
ltt = false

local function IsFirstPerson()
	return (head.CFrame.p - camera.CFrame.p).Magnitude < 1
end

local connections = {}
function newConnection(Connection)
	connections[#connections + 1] = Connection
end

newConnection(mouse.Button1Down:Connect(function()
	if dead == false then
		lt = false
		ltt = false

		if game:GetService("Players"):GetPlayerFromCharacter(mouse.Target.Parent) then
			if mouse.Target.Parent.Name == char.Name or mouse.Target.Parent.Name == DummyName then return end
			game:GetService("RunService").RenderStepped:Wait()
			wait(1)
		elseif game:GetService("Players"):GetPlayerFromCharacter(mouse.Target.Parent.Parent) then
			if mouse.Target.Parent.Name == char.Name or mouse.Target.Parent.Name == DummyName then return end

			game:GetService("RunService").RenderStepped:Wait()
			wait(1)
		else
			game:GetService("RunService").RenderStepped:Wait()
			wait(1)
		end
		wait()
		lt = true
	end
end))


local CloneChar = workspace[DummyName]

ArtificialHB = Instance.new('BindableEvent')
ArtificialHB.Name = 'Heartbeat'

frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()

ArtificialHB:Fire()

game:GetService('RunService').Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)
local makesound = function(soundid,speed,volume,parent)
	local sound = Instance.new("Sound")
	sound.SoundId = soundid
	sound.RollOffMaxDistance = 100
	sound.PlaybackSpeed =speed 
	sound.Volume = volume
	sound.Parent = parent
	return sound
end
local Callerp = function(Start,End,Percent)
	return (Start - (End - Start) * Percent)
end
function swait(t)
	game:GetService('RunService').Stepped:wait()
end

local TweenService = game:GetService("TweenService")
local CF = CFrame.new
local CFA = CFrame.Angles
local head = CloneChar:WaitForChild("Head")
local tors = CloneChar:WaitForChild("Torso")
local huma = CloneChar:WaitForChild("Humanoid")
huma.DisplayName = " "
local neck = Instance.new("Weld",tors)
neck.Part0 = tors
neck.Part1 = head
neck.C0 = CF(0,1.5,0)
local nek = neck.C1
neck.Enabled = true
local root = CloneChar.HumanoidRootPart.RootJoint.C0
local rs = tors["Right Shoulder"].C0
local ls = tors["Left Shoulder"].C0
local rh = tors["Right Hip"].C0
local lh = tors["Left Hip"].C0
local RootPart = CloneChar:WaitForChild("HumanoidRootPart")
local Humanoid = CloneChar.Humanoid
local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
Humanoid.JumpPower = 80
local Attacking = false
local AttackANVal = 1
rayCast = function(Pos, Dir, Max, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), (CloneChar and LocalPlayer.Character))
end

task.spawn(function()
	repeat
		wait()
	until Humanoid.Health < 0.1
end)

local Tail = CloneChar:FindFirstChild("PlainTail")
if Tail ~= nil then
	TailWeld = Tail.AccessoryWeld
else
	TailWeld = Instance.new("Weld", workspace)
end

local TC0 = TailWeld.C0 * CFrame.new(0,0,0.4)
local Running = false

local MakeTween = function(timetack,easingstyle,easingdirection,repeats,flipflop)
	local newtween = TweenInfo.new(
		timetack, 
		easingstyle, 
		easingdirection, 
		repeats, 
		flipflop, 
		0 
	)
	return newtween
end
local DOTWEEN = function(Part,tim,value)
	local Tween = MakeTween(tim,Enum.EasingStyle.Circular,Enum.EasingDirection.InOut,0,false)
	TweenService:Create(Part,Tween,{C0= value}):Play()
end
local LerpStyle = function(lerpmagnet,easingstyle,easingdirection)
	local newstyle = TweenService:GetValue(lerpmagnet,easingstyle,easingdirection)
	return newstyle
end

local SpinKick  = function()
	if Attacking == false then
		Attacking = true 
		for i = 0,60,1 do
			swait()
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(30),math.rad(0),math.rad(0)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-20)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-20 + -10)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-30 - -6)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
		end 
		RootPart.Anchored = true
		for i = 0,60,1 do
			swait()
			RootPart.Position = RootPart.Position + Vector3.new(0,0.6,0)
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(-20 + -36*i),math.rad(0),math.rad(0)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.0,0,0) * CFA(math.rad(0),math.rad(30),math.rad(40)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(-30),math.rad(-40)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(50)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(30)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
		end 
		RootPart.Anchored = false
		Attacking = false
	end
end


local ComboCont = 1
local Attack = function()
	if Attacking == false then
		Attacking = true
		if ComboCont == 1 then
			for i = 0,10,1 do
				swait()
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(-30),math.rad(0),math.rad(80)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.5,0,-1.2) * CFA(math.rad(0),math.rad(90),math.rad(90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(10)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(30)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end 

			for i = 0,15,1 do
				swait()
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,-3,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.5,0,0) * CFA(math.rad(0),math.rad(-85),math.rad(90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(40)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(30)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end
			ComboCont = 2


		elseif ComboCont == 2 then
			for i = 0,10,1 do
				swait()
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(90),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(-30),math.rad(0),math.rad(90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-12)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(10)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(30)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end 

			for i = 0,10,1 do
				swait()
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(-90),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,-3,0) * CFA(math.rad(0),math.rad(0),math.rad(-90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-12)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0.5) * CFA(math.rad(0),math.rad(90),math.rad(-90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(10)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(30)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end 
			ComboCont = 3
		elseif ComboCont == 3 then
			for i = 0,10,1 do
				swait()
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(10),math.rad(0),math.rad(-50)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-5)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(8)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(-50),math.rad(-98)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(20),math.rad(0)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end 

			for i = 0,15,1 do
				swait()
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(90),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,-3,0) * CFA(math.rad(-40),math.rad(0),math.rad(90)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-5)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(8)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(90),math.rad(-90+40)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(-90),math.rad(0)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end 
			ComboCont = 1
		end
		Attacking = false
	end
end
local Mouse = LocalPlayer:GetMouse()
local B1Hold = false
newConnection(Mouse.Button1Down:Connect(function()
	B1Hold = true 
	while B1Hold == true do
		wait()
		Attack()
	end
end))
local Running = false
newConnection(Mouse.Button1Up:Connect(function()
	B1Hold = false
end))
newConnection(Mouse.KeyDown:Connect(function(key)
	if key == "z" then
		SpinKick()
	else
		if key == "t" and Attacking == false then
			Attacking = true
			makesound("rbxassetid://6433451653",1,1,tors):Play()
			for i=0,100 do
				swait()
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad( -15 + math.rad(math.sin(time()*16)*15)),0,0),LerpStyle(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(-10 +  math.sin(time()*16)*10),math.rad(0),math.rad(0)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0.4 + math.sin(time()*17)*0.4,0) * CFA(0,math.rad(90),math.rad(123)),LerpStyle(0.07*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(10),0,math.rad(-90)),LerpStyle(0.07*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(-30 + math.sin(time()*17)*20),math.rad(-10 +  math.sin(time()*16)*10)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(10 +  math.sin(time()*16)*-10)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				TailWeld.C0 = TailWeld.C0:Lerp(TC0 * CFrame.Angles(math.rad(-20 + math.sin(-time()*3.83)*-20),math.rad(-math.sin(time()*3.83/2)*24),0),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			end
			Attacking = false
		else
			if key == "r" and Attacking == false then
				Attacking = true
				while LocalPlayer.Character.Humanoid.MoveDirection.Magnitude < 0.1 do
					swait()
					neck.C1 = neck.C1:Lerp(nek * CF(0,-0.4,0) * CFA(math.rad(-90),math.rad(-math.cos(time()*3)*30),0),LerpStyle(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut))
					RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,-2.5) * CFA(math.rad(78),math.rad(math.sin(time()*3)*12),math.rad(math.rad(math.sin(time()*3)*40))),LerpStyle(0.3*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
					tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.3,0.4 +0.4+math.sin(time()*3)*0.2,-0.4 -0.2+math.sin(time()*3)*0.2) * CFA(math.rad(-45)+math.rad(math.sin(time()*3)*12),math.rad(0),math.rad(180 - 10+math.cos(time()*3)*5)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
					tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(-0.3,0.4+0.4-math.sin(time()*3)*0.2,-0.4 -0.2+math.sin(time()*3)*0.2) * CFA(math.rad(-45)-math.rad(math.sin(time()*3)*12),math.rad(0),math.rad(-180 + 10 +math.cos(time()*3)*5)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
					tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(-math.sin(time()*3)*12),math.rad(math.sin(time()*3)*30),math.rad(-12 - 50 + math.cos(time()*3)*30)),LerpStyle(0.3*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
					tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(-math.sin(time()*3)*12),math.rad(math.sin(time()*3)*30),math.rad(12 + 50 + math.cos(time()*3)*30)),LerpStyle(0.3*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
					TailWeld.C0 = TailWeld.C0:Lerp(TC0 * CFrame.Angles(math.rad(0),0,math.rad(math.cos(time()*3)*40)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				end
				Attacking = false
			else if key == "f" then
					if Running == false then
						Running = true 
						Humanoid.WalkSpeed = 40
					else
						Running = false
						Humanoid.WalkSpeed = 20
					end
				elseif key == "x" and Attacking == false and Mouse.Target.Parent:FindFirstChildWhichIsA("Humanoid") ~= nil then
					Attacking = true
					local Camera = workspace.CurrentCamera
					Camera.CameraType = "Scriptable"
					local Target = Mouse.Target.Parent
					for i = 0,200,1 do
						swait()
						Camera.CFrame = Camera.CFrame:Lerp(CFrame.new((head.CFrame * CFrame.new(0,0,-5)).Position,head.CFrame.Position),1)
						neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(20),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(20),math.rad(0),math.rad(0)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,-0.5,0) * CFA(math.rad(-25),math.rad(0),math.rad(00)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,-0.5,0) * CFA(math.rad(-25),math.rad(0),math.rad(00)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20+ -40)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-20+ -4)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
					end

					for i = 0,20,1 do
						swait()
						Camera.CFrame = Camera.CFrame:Lerp(CFrame.new((head.CFrame * CFrame.new(0,0,-3)).Position,head.CFrame.Position),1)
						neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(20),math.rad(0),math.rad(0)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,-0.5,0) * CFA(math.rad(-40),math.rad(0),math.rad(00)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,-0.5,0) * CFA(math.rad(-40),math.rad(0),math.rad(00)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20+ -40)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-20+ -4)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
					end
					RootPart.CFrame = Target.HumanoidRootPart.CFrame * CFrame.new(0,0,-8)
					for i = 0,100,1 do
						swait()
						Camera.CFrame = Camera.CFrame:Lerp(CFrame.new((head.CFrame * CFrame.new(-3,0,0)).Position,Target.HumanoidRootPart.CFrame.Position),0.2)
						neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(20),math.rad(0),math.rad(0)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,-0.5,0) * CFA(math.rad(-80),math.rad(0),math.rad(-20)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,-0.5,0) * CFA(math.rad(-80),math.rad(0),math.rad(20)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20+ -40)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-20+ -4)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
					end
					Attacking = false
					Camera.CameraType = "Custom"
				end
			end
		end
	end
end))
local RLA = CFrame.new(0,0,0)

local Anim = "Idle"
Humanoid.WalkSpeed = 20

while true do
	swait()

	if workspace[DummyName]:FindFirstChild("Animation") and workspace[DummyName].Animation.Value ~= "neko" then
		local Camera = workspace.CurrentCamera
		Humanoid.WalkSpeed = 16
		Humanoid.JumpPower = 50

		Anim = ""

		if TailWeld.Parent == workspace then
			TailWeld:Destroy()
		end

		for _, Connection in pairs(connections) do
			pcall(function()
				Connection:Disconnect()
				Connection = nil
			end)
		end

		Camera.CameraType = "Custom"
		Camera.CameraSubject = workspace[DummyName]

		break
	end

	hitfloor = rayCast(RootPart.Position, CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 0.5, 0)).lookVector, 4, CloneChar)
	
	local torvel = (LocalPlayer.Character.Humanoid.MoveDirection * Vector3.new(1, 0, 1)).magnitude
	local velderp = RootPart.Velocity.y
	
	if RootPart.Velocity.y > 0 and hitfloor == nil then
		Anim = "Jumping"
	elseif RootPart.Velocity.y < 0 and hitfloor == nil then
		Anim = "Falling"
	elseif torvel < .5 and hitfloor ~= nil  then
		Anim = "Idle"
	elseif torvel > .5 and  hitfloor ~= nil  then
		Anim = "Walking"
	end
	
	local W1 = LocalPlayer.Character.Humanoid.MoveDirection* RootPart.CFrame.LookVector
	local W2 = LocalPlayer.Character.Humanoid.MoveDirection* RootPart.CFrame.RightVector
	
	WVA = W1.X+W1.Z
	RLV = W2.X+W2.Z

	if Attacking == false then
		if Anim == "Falling" then
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0.3) * CFA(math.rad(20),0,0),LerpStyle(0.4,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root *CF(0,0,0) * CFA(0,0,0),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(math.rad(-40),0,math.rad(5)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(-40),0,math.rad(-5)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0.4,0.8,0) * CFA(0,0,math.rad(10)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0.4,0.5,0)  * CFA(0,0,math.rad(50)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
		elseif Anim == "Jumping" then
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0.3) * CFA(math.rad(-20),0,0),LerpStyle(0.4,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root *CF(0,0,0) * CFA(0,0,0),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(0,math.rad(-40),math.rad(-20)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(0,math.rad(40),math.rad(20)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0.4,0.8,0) * CFA(0,0,math.rad(-10)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0.4,0.5,0)  * CFA(0,0,math.rad(-50)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
		elseif Anim == "Idle" then
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(7+math.cos(time()*3.83)*-5 + (-6 + math.sin(time()*3.83)*6 )),math.rad(-24) + math.rad( math.sin((time()*3.83)/2)*10),math.rad(-math.cos((time()*3.83)/2)*13)),LerpStyle(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,math.cos((time()*3.83))/10) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.4*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(-0.1,math.cos((time()*3.83))/10,0) * CFA(math.rad(-5)- -math.sin((-time()*3.83))/8.7,math.rad(0),math.rad(5)+math.cos((-time()*3.83))/8.7),LerpStyle(0.3*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0.1,math.cos((time()*3.83))/10,0) * CFA(math.rad(-5)- -math.sin((-time()*3.83))/8.7,math.rad(0),math.rad(-5)-math.cos((-time()*3.83))/8.7),LerpStyle(0.3*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,-math.cos((time()*3.83))/8,0) * CFA(math.rad(-4),math.rad(-12),math.rad(8)),LerpStyle(0.4*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,-math.cos((time()*3.83))/8,0) * CFA(math.rad(-1),math.rad(7),math.rad(2)),LerpStyle(0.4*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			TailWeld.C0 = TailWeld.C0:Lerp(TC0 * CFrame.Angles(math.rad(-20 + math.sin(-time()*3.83)*-20),math.rad(-math.sin(time()*3.83/2)*24),0),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
		elseif Anim == "Walking" and Running == false then
			RLA =  CFrame.new((math.sin((time()*8))/1)*0.5 *WVA,0.3*(1-WVA),(math.sin((time()*8))/1)*0.5 *RLV) * CFrame.Angles((-math.sin((time()*8))/1.5)*RLV,0,(math.sin((time()*8))/1.2)*WVA)
			LLA =  CFrame.new((math.sin((time()*8))/1)*0.5 *WVA,0.3*(1-WVA),(math.sin((time()*8))/1)*0.5 *RLV) * CFrame.Angles((-math.sin((time()*8))/1.5)*RLV,0,(math.sin((time()*8))/1.2)*WVA)
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(7),math.clamp(math.cos((time()*8))*0.2 + math.rad(-RootPart.RotVelocity.Y*8),math.rad(-85),math.rad(85)),math.rad(-RootPart.RotVelocity.Y*0.4)),LerpStyle(0.4,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root *CF(0,-math.sin((time()*8*2))/3.2,-math.sin((time()*8*2))/3) * CFA(math.rad( -15 + 10 + WVA*15) + -math.rad(math.sin(time() *(8*2))*10),math.clamp( math.rad(0) - -RootPart.RotVelocity.Y/50,math.rad(-20),math.rad(20)),math.cos((time()*8))*0.2),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(-math.sin((time()*8))/4.5,0,0) * CFA(math.rad(-5),-math.sin((time()*8))*0.1 + math.rad(RootPart.RotVelocity.Y*3),-math.sin((time()*8))*0.4),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(-math.sin((time()*8))/4.5,0,0) * CFA(math.rad(-5),-math.sin((time()*8))*0.1 + math.rad(RootPart.RotVelocity.Y*3),-math.sin((time()*8))*0.4),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,(math.cos((time()*8))/8),0) * RLA * CFA(0, (-math.sin((time()*8))*0.5)*WVA,math.rad( -15 + 10 + WVA*15) + -math.rad(math.sin(time() *(8*2))*10)),LerpStyle(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,(-math.cos((time()*8))/8),0) * LLA * CFA(0, (-math.sin((time()*8))*0.5)*WVA,-math.rad( -15 + 10 + WVA*15) + math.rad(math.sin(time() *(8*2))*10)),LerpStyle(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			TailWeld.C0 = TailWeld.C0:Lerp(TC0 * CFrame.Angles(math.rad(-30 + math.sin(-time()*8)*-20),0,-math.rad(-math.sin(time()*8/2)*20 + RLV*2)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
		elseif Anim == "Walking" and Running == true then
			RLA =  CFrame.new(0,(0.5 + math.cos(time()*15)*0.5)*WVA+ 0.2,(0.5 - math.cos(time()*15)*0.5)*RLV+ 0.2) * CFrame.Angles(0,-math.rad(math.sin(time()*15)*80)*RLV,math.rad(math.sin(time()*15)*80)*WVA)
			LLA =  CFrame.new(0,(0.5 + math.cos(time()*15)*0.5)*WVA- 0.2,(-0.5 + math.cos(time()*15)*0.5)*RLV- 0.2) * CFrame.Angles(0,-math.rad(math.sin(time()*15)*80)*RLV,math.rad(-math.sin(time()*15)*80)*WVA)
			RAA = CFrame.new(0,0.8 + math.sin(time()*15)*0.9*WVA,math.sin(time()*15)*0.9*RLV) * CFrame.Angles(0,math.rad(-math.cos(time()*15)*85)*RLV,math.rad(math.cos(time()*15)*85)*WVA)
			LAA = CFrame.new(0,0.8 + math.sin(time()*15)*0.9*WVA,math.sin(time()*15)*0.9*-RLV) * CFrame.Angles(0,math.rad(-math.cos(time()*15)*85)*RLV,math.rad(-math.cos(time()*15)*85)*WVA)
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(0,math.rad(-RootPart.RotVelocity.Y*5),0),LerpStyle(0.4,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root *CF((-1 - math.sin(time()*15)*2)*RLV,(-1 - math.sin(time()*15)*2)*WVA,-1 + 0.5 -math.sin(time()*15)*0.8) * CFA(math.rad(80 - math.cos(time()*15)*20),0,0),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.6+ math.sin(time()*15)*1,0,-0.6)* RAA * CFA(math.rad(-10 - -math.cos(time()*15*2)*10),0,math.rad(80)),LerpStyle(0.6,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(-0.6+ -math.sin(time()*15)*1,0,-0.6) * LAA * CFA(math.rad(-10 - -math.cos(time()*15*2)*10),0,math.rad(-80)),LerpStyle(0.6,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0.4 + -math.cos(time()*15)*0.9,0,0) * RLA * CFA(0, 0,math.rad(50)),LerpStyle(0.6,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(-0.4+ math.cos(time()*15)*0.9,0,0) * LLA * CFA(0, 0,math.rad(-80)),LerpStyle(0.6,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			TailWeld.C0 = TailWeld.C0:Lerp(TC0 * CFrame.new(0,0.7,0.3) * CFrame.Angles(math.rad(-110 + math.sin(-time()*15)*-20),-math.rad(RLV*30),0),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
		end
	end
end
